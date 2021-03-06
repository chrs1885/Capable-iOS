#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(OSX)
    import AppKit
#else
    import Foundation
#endif

class SwitchControl: FeatureProtocol {
    static let name = "switchControl"
    let notificationCenter: NotificationCenterProtocol

    #if os(OSX)

        private var keyValueObservation: NSKeyValueObservation?

    #endif

    init(notificationCenter: NotificationCenterProtocol = NotificationCenter.default) {
        self.notificationCenter = notificationCenter
        registerObservation()
    }

    var isEnabled: Bool {
        #if os(iOS) || os(tvOS)

            return UIAccessibility.isSwitchControlRunning

        #elseif os(OSX)

            return NSWorkspace.shared.isSwitchControlEnabled

        #else

            return false

        #endif
    }

    var status: String {
        isEnabled.statusString
    }
}

extension SwitchControl: ObservableFeatureProtocol {
    func registerObservation() {
        #if os(iOS) || os(tvOS)

            notificationCenter.addObserver(
                self,
                selector: #selector(valueChanged),
                name: UIAccessibility.switchControlStatusDidChangeNotification,
                object: nil
            )

        #elseif os(OSX)

            keyValueObservation = NSWorkspace.shared.observe(\NSWorkspace.isSwitchControlEnabled) { _, _ in
                self.valueChanged()
            }

        #endif
    }

    @objc func valueChanged() {
        postNotification(featureName: Self.name, statusString: status)
    }
}
