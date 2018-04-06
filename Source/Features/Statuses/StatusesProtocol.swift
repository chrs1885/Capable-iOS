//
//  StatusesProtocol.swift
//  Capable
//
//  Created by Christoph Wendt on 23.03.18.
//

public protocol StatusesProtocol {
    var features: [CapableFeature] { get set }
    var statusMap: [CapableFeature: String] { get }
    
    var isAssistiveTouchEnabled: Bool { get }
    var isBoldTextEnabled: Bool { get }
    var isClosedCaptioningEnabled: Bool { get }
    var isDarkerSystemColorsEnabled: Bool { get }
    var isGrayscaleEnabled: Bool { get }
    var isGuidedAccessEnabled: Bool { get }
    var isInvertColorsEnabled: Bool { get }
    var largerTextCatagory: UIContentSizeCategory { get }
    var isMonoAudioEnabled: Bool { get }
    var isReduceMotionEnabled: Bool { get }
    var isReduceTransparencyEnabled: Bool { get }
    var isShakeToUndoEnabled: Bool { get }
    var isSpeakScreenEnabled: Bool { get }
    var isSpeakSelectionEnabled: Bool { get }
    var isSwitchControlEnabled: Bool { get }
    var isVoiceOverEnabled: Bool { get }
    
    init()
    init(with features: [CapableFeature])

    func isFeatureEnable(feature: CapableFeature) -> Bool
}