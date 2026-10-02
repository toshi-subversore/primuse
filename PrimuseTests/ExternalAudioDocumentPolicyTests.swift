import Foundation
import XCTest
@testable import Primuse

final class ExternalAudioDocumentPolicyTests: XCTestCase {
    func testAcceptsSupportedAudioFileURLs() {
        for name in ["track.aac", "track.WAV", "track.mp3", "track.flac", "track.m4a"] {
            XCTAssertTrue(
                ExternalAudioDocumentPolicy.canOpen(URL(fileURLWithPath: "/tmp/\(name)")),
                name
            )
        }
    }

    func testRejectsUnsupportedFilesAndNonFileURLs() {
        XCTAssertFalse(
            ExternalAudioDocumentPolicy.canOpen(URL(fileURLWithPath: "/tmp/document.pdf"))
        )
        XCTAssertFalse(
            ExternalAudioDocumentPolicy.canOpen(URL(string: "https://example.com/track.aac")!)
        )
    }
}
