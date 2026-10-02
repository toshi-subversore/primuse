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

    func testManagedPlaybackRejectsDirectoriesAndSymbolicLinks() throws {
        let root = LocalImportService.ensureMusicDirectory()
        let suffix = UUID().uuidString
        let regular = root.appendingPathComponent("open-with-\(suffix).flac")
        let directory = root.appendingPathComponent("open-with-dir-\(suffix)", isDirectory: true)
        let symlink = root.appendingPathComponent("open-with-link-\(suffix).flac")
        defer {
            try? FileManager.default.removeItem(at: symlink)
            try? FileManager.default.removeItem(at: regular)
            try? FileManager.default.removeItem(at: directory)
        }

        try Data(repeating: 0, count: 2_048).write(to: regular)
        try FileManager.default.createDirectory(at: directory, withIntermediateDirectories: false)
        try FileManager.default.createSymbolicLink(at: symlink, withDestinationURL: regular)

        XCTAssertTrue(ExternalAudioDocumentPolicy.isSafeManagedFile(regular))
        XCTAssertFalse(ExternalAudioDocumentPolicy.isSafeManagedFile(directory))
        XCTAssertFalse(ExternalAudioDocumentPolicy.isSafeManagedFile(symlink))
    }

    func testManagedSourceDispositionPreservesDisabledSources() {
        XCTAssertEqual(
            ExternalAudioDocumentPolicy.managedSourceDisposition(
                exists: true,
                isDeleted: false,
                isEnabled: false
            ),
            .reuse
        )
        XCTAssertEqual(
            ExternalAudioDocumentPolicy.managedSourceDisposition(
                exists: true,
                isDeleted: false,
                isEnabled: true
            ),
            .reuse
        )
        XCTAssertEqual(
            ExternalAudioDocumentPolicy.managedSourceDisposition(
                exists: true,
                isDeleted: true,
                isEnabled: false
            ),
            .restore
        )
        XCTAssertEqual(
            ExternalAudioDocumentPolicy.managedSourceDisposition(
                exists: false,
                isDeleted: false,
                isEnabled: false
            ),
            .create
        )
    }

    func testManagedSourceRepairFixesStalePathWithoutEnablingSource() {
        let source = MusicSource(
            id: "managed-local",
            name: "Local Music",
            type: .local,
            basePath: "/old/container/Documents/LocalMusic",
            isEnabled: false
        )

        let repaired = ExternalAudioDocumentPolicy.repairedManagedSource(source)

        XCTAssertEqual(repaired.basePath, LocalImportService.musicDirectory.path)
        XCTAssertFalse(repaired.isEnabled)
        XCTAssertFalse(repaired.isDeleted)
    }

    func testImportFailureProducesUserVisibleAlert() throws {
        var result = LocalImportService.CopyResult()
        result.discovered = 1
        result.failed = 1
        result.failures = [
            LocalImportService.CopyFailure(
                fileName: "broken.flac",
                reason: .invalidAudioFile,
                detail: "decoder rejected the file"
            )
        ]

        let alert = try XCTUnwrap(
            ExternalAudioDocumentPolicy.importFailureAlert(for: result)
        )

        XCTAssertFalse(alert.title.isEmpty)
        XCTAssertTrue(alert.message.contains("broken.flac"))
        XCTAssertTrue(alert.message.contains(
            String(localized: "local_import_reason_invalid_audio")
        ))
    }

    func testSuccessfulOrCancelledImportDoesNotProduceFailureAlert() {
        var successful = LocalImportService.CopyResult()
        successful.copied = 1
        successful.resolvedManagedFileNames = ["track.flac"]
        XCTAssertNil(
            ExternalAudioDocumentPolicy.importFailureAlert(for: successful)
        )

        var cancelled = LocalImportService.CopyResult()
        cancelled.cancelled = true
        cancelled.failed = 1
        cancelled.failures = [
            LocalImportService.CopyFailure(
                fileName: "track.flac",
                reason: .copyFailed,
                detail: nil
            )
        ]
        XCTAssertNil(
            ExternalAudioDocumentPolicy.importFailureAlert(for: cancelled)
        )
    }

    func testSourcePersistenceFailureProducesUserVisibleAlert() {
        let alert = ExternalAudioDocumentPolicy.sourcePersistenceFailureAlert()

        XCTAssertFalse(alert.title.isEmpty)
        XCTAssertTrue(
            alert.message.contains(
                String(localized: "local_import_reason_database")
            )
        )
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
