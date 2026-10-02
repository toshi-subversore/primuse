#if os(iOS)
import Intents
import UIKit
import XCTest
@testable import Primuse

@MainActor
final class SiriRadioIntentRoutingTests: XCTestCase {
    func testAppBundleDeclaresBothMediaIntentsForColdLaunch() {
        let supported = Bundle(for: PrimuseAppDelegate.self)
            .object(forInfoDictionaryKey: "INIntentsSupported") as? [String]

        XCTAssertEqual(
            Set(supported ?? []),
            Set(["INPlayMediaIntent", "INSearchForMediaIntent"])
        )
    }

    func testColdAppDelegateRoutesMediaSearchToTheRadioCapableHandler() {
        let delegate = PrimuseAppDelegate()
        let intent = INSearchForMediaIntent(mediaItems: nil, mediaSearch: nil)

        let handler = delegate.application(UIApplication.shared, handlerFor: intent)

        XCTAssertTrue(handler is PlayMediaIntentHandler)
        XCTAssertTrue(handler is any INSearchForMediaIntentHandling)
    }

    func testColdAppDelegateKeepsPlayMediaRoutingOnTheSameHandler() {
        let delegate = PrimuseAppDelegate()
        let intent = INPlayMediaIntent(
            mediaItems: nil,
            mediaContainer: nil,
            playShuffled: false,
            playbackRepeatMode: .unknown,
            resumePlayback: false,
            playbackQueueLocation: .now,
            playbackSpeed: nil,
            mediaSearch: nil
        )

        let handler = delegate.application(UIApplication.shared, handlerFor: intent)

        XCTAssertTrue(handler is PlayMediaIntentHandler)
        XCTAssertTrue(handler is any INPlayMediaIntentHandling)
    }
}



@MainActor
final class ExternalAudioOpenTests: XCTestCase {
    func testAppBundleRegistersAudioDocumentsForOpenWith() throws {
        let documentTypes = try XCTUnwrap(
            Bundle(for: PrimuseAppDelegate.self)
                .object(forInfoDictionaryKey: "CFBundleDocumentTypes")
                as? [[String: Any]]
        )
        let audio = try XCTUnwrap(documentTypes.first { row in
            (row["LSItemContentTypes"] as? [String])?.contains("public.audio") == true
        })

        XCTAssertEqual(audio["CFBundleTypeRole"] as? String, "Viewer")
        XCTAssertEqual(audio["LSHandlerRank"] as? String, "Alternate")
    }

    func testRuntimePolicyAcceptsOnlySupportedLocalAudioURLs() {
        for fileName in ["track.aac", "track.WAV", "track.mp3", "track.FLAC", "track.m4a"] {
            XCTAssertTrue(
                ExternalAudioDocumentPolicy.canOpen(
                    URL(fileURLWithPath: "/tmp/\(fileName)")
                ),
                fileName
            )
        }

        XCTAssertFalse(
            ExternalAudioDocumentPolicy.canOpen(
                URL(fileURLWithPath: "/tmp/document.pdf")
            )
        )
        XCTAssertFalse(
            ExternalAudioDocumentPolicy.canOpen(
                URL(string: "https://example.com/track.flac")!
            )
        )
    }

    func testManagedDestinationRejectsPathTraversalAndAbsolutePaths() {
        for value in [
            "../escape.flac",
            "folder/track.flac",
            "/tmp/track.flac",
            ".",
            "..",
            "",
        ] {
            XCTAssertNil(
                ExternalAudioDocumentPolicy.managedFileURL(fileName: value),
                value
            )
        }

        let safe = ExternalAudioDocumentPolicy.managedFileURL(
            fileName: "track.flac"
        )
        XCTAssertEqual(
            safe?.deletingLastPathComponent().standardizedFileURL,
            LocalImportService.musicDirectory.standardizedFileURL
        )
        XCTAssertEqual(safe?.lastPathComponent, "track.flac")
    }

    func testNewestOpenRequestSupersedesEarlierRequest() {
        var state = ExternalAudioOpenRequestState()

        let first = state.begin()
        XCTAssertTrue(state.isCurrent(first))

        let second = state.begin()
        XCTAssertFalse(state.isCurrent(first))
        XCTAssertTrue(state.isCurrent(second))

        state.finish(first)
        XCTAssertTrue(state.isCurrent(second))

        state.finish(second)
        XCTAssertFalse(state.isCurrent(second))
    }

    func testManagedRelativePathIsCanonicalForLocalScannerIdentity() {
        let url = LocalImportService.musicDirectory
            .appendingPathComponent("Track.FLAC")

        XCTAssertEqual(
            ExternalAudioDocumentPolicy.managedRelativePath(for: url),
            "/Track.FLAC"
        )

        XCTAssertEqual(
            LocalFileSource.songID(
                sourceID: "local-source",
                path: "/Track.FLAC"
            ),
            LocalFileSource.songID(
                sourceID: "local-source",
                path: ExternalAudioDocumentPolicy.managedRelativePath(for: url)
            )
        )
    }
}

#endif
