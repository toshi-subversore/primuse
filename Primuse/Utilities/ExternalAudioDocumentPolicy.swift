import Foundation
import PrimuseKit

/// Decides whether a file URL received through iOS document opening belongs to
/// one of Primuse's supported audio formats.
///
/// Keeping this policy separate from the SwiftUI scene handler makes the
/// Files/Open With contract easy to test without launching the whole app.
enum ExternalAudioDocumentPolicy {
    static func canOpen(_ url: URL) -> Bool {
        guard url.isFileURL else { return false }
        return PrimuseConstants.supportedAudioExtensions.contains(
            url.pathExtension.lowercased()
        )
    }
}
