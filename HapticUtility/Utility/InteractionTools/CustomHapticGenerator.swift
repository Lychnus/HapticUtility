//
//  CustomHapticGenerator.swift
//  HapticUtility
//
//  Created by Tahir Anil Oghan on 24.07.2025.
//

import UIKit

// MARK: - Protocol
/// A protocol that defines the interface for triggering various haptic feedback types.
public protocol HapticGenerator {
    
    /// Triggers a haptic feedback according to the provided feedback style.
    ///
    /// - Parameters:
    ///   - feedback: The type of feedback to generate.
    ///
    /// - Note: Available only on platforms that support UIKit haptics (iOS, iPadOS, macCatalyst).
    func trigger(_ feedback: HapticGeneratorFeedback)
}

// MARK: - Helpers
/// Enum representing supported haptic feedback types.
public enum HapticGeneratorFeedback {
    
    /// Triggers a strong, heavy impact — ideal for important confirmations or forceful interactions.
    case heavy
    
    /// Triggers a strong, heavy impact at given point— ideal for important confirmations or forceful interactions.
    /// - Note: Only available on iOS 17.5+ and macCatalyst 17.5+. If used below the target version, it has no effect.
    case heavyAt(CGPoint)

    /// Triggers a quick, light tap — perfect for subtle or soft touch interactions.
    case light
    
    /// Triggers a quick, light tap at given point — perfect for subtle or soft touch interactions.
    /// - Note: Only available on iOS 17.5+ and macCatalyst 17.5+. If used below the target version, it has no effect.
    case lightAt(CGPoint)

    /// Triggers a balanced, medium-strength impact — best for standard UI taps and button presses.
    case medium
    
    /// Triggers a balanced, medium-strength impact at given point — best for standard UI taps and button presses.
    /// - Note: Only available on iOS 17.5+ and macCatalyst 17.5+. If used below the target version, it has no effect.
    case mediumAt(CGPoint)

    /// Triggers a sharp, rigid impact — feels stiff and snappy, like tapping something firm.
    case rigid
    
    /// Triggers a sharp, rigid impact at given point — feels stiff and snappy, like tapping something firm.
    /// - Note: Only available on iOS 17.5+ and macCatalyst 17.5+. If used below the target version, it has no effect.
    case rigidAt(CGPoint)

    /// Triggers a soft, squishy impact — mimics soft or padded elements being pressed.
    case soft
    
    /// Triggers a soft, squishy impact at given point — mimics soft or padded elements being pressed.
    /// - Note: Only available on iOS 17.5+ and macCatalyst 17.5+. If used below the target version, it has no effect.
    case softAt(CGPoint)

    /// Triggers a selection change haptic, useful for picker selections or segmented controls.
    case selectionChange
    
    /// Triggers a selection change haptic at given point, useful for picker selections or segmented controls.
    /// - Note: Only available on iOS 17.5+ and macCatalyst 17.5+. If used below the target version, it has no effect.
    case selectionChangeAt(CGPoint)

    /// Triggers a success feedback, used after a successful operation.
    case success
    
    /// Triggers a success feedback at given point, used after a successful operation.
    /// - Note: Only available on iOS 17.5+ and macCatalyst 17.5+. If used below the target version, it has no effect.
    case successAt(CGPoint)

    /// Triggers a warning feedback, suitable for cautionary messages.
    case warning
    
    /// Triggers a warning feedback at given point, suitable for cautionary messages.
    /// - Note: Only available on iOS 17.5+ and macCatalyst 17.5+. If used below the target version, it has no effect.
    case warningAt(CGPoint)

    /// Triggers an error feedback, for failed operations or critical alerts.
    case error
    
    /// Triggers an error feedback at given point, for failed operations or critical alerts.
    /// - Note: Only available on iOS 17.5+ and macCatalyst 17.5+. If used below the target version, it has no effect.
    case errorAt(CGPoint)
    
    /// Triggers feedback at given point to indicate when an alignment occurs, such as snapping an object to a guide or ruler.
    /// - Note: Only available on iOS 17.5+ and macCatalyst 17.5+. If used below the target version, it has no effect.
    case alignmentOccurredAt(CGPoint)
    
    /// Triggers feedback at given point to indicate path completion or shape recognition.
    /// - Note: Only available on iOS 17.5+ and macCatalyst 17.5+. If used below the target version, it has no effect.
    case pathCompletedAt(CGPoint)
}

// MARK: - Implementation
/// A centralized implementation of haptic feedbacks using UIKit's built-in feedback generators.
internal final class CustomHapticGenerator {
    
    /// Singleton instance.
    internal static let shared: CustomHapticGenerator = CustomHapticGenerator()
    
    /// Use impact feedback to indicate when an impact occurs.
    /// Feedback generator for impact-based interactions (light, medium, heavy, etc.).
    /// For example, you might trigger impact feedback when a user taps a button.
    private var impactFeedbackGenerator: UIImpactFeedbackGenerator = UIImpactFeedbackGenerator()
    
    /// Use selection feedback to communicate movement through a series of discrete values.
    /// Feedback generator for selection changes (used in sliders, pickers, etc.).
    /// For example, you might trigger selection feedback to indicate that a UI element’s values are changing.
    private var selectionChangeFeedbackGenerator: UISelectionFeedbackGenerator = UISelectionFeedbackGenerator()
    
    /// Use notification feedback to communicate that a task or action succeeded, failed, or produced a warning of some kind.
    /// Feedback generator for success, warning, and error notifications.
    private var notificationFeedbackGenerator: UINotificationFeedbackGenerator = UINotificationFeedbackGenerator()
    
    /// Use canvas feedback to indicate when a drawing event occurs, such as an object snapping to a guide or ruler.
    /// Feedback generator for alignment and drawing-related interactions using Apple Pencil Pro.
    /// When using Apple Pencil Pro with a compatible iPad, this type of feedback can provide a tactile response.
    private var canvasFeedbackGenerator: UICanvasFeedbackGenerator = UICanvasFeedbackGenerator()
    
    /// Secured initializer to enforce `.shared` usage.
    private init() { }
}

// MARK: - Protocol Conformance
extension CustomHapticGenerator: HapticGenerator {
    
    internal func trigger(_ feedback: HapticGeneratorFeedback) {
        #if os(iOS) || targetEnvironment(macCatalyst)
        switch feedback {
            case .heavy:
                impactFeedbackGenerator.prepare()
                impactFeedbackGenerator.impactOccurred(intensity: 0.9)
                
            case .heavyAt(let coordinate):
                if #available(iOS 17.5, macCatalyst 17.5, *) {
                    impactFeedbackGenerator.prepare()
                    impactFeedbackGenerator.impactOccurred(intensity: 0.9, at: coordinate)
                }
                
            case .light:
                impactFeedbackGenerator.prepare()
                impactFeedbackGenerator.impactOccurred(intensity: 0.4)
                
            case .lightAt(let coordinate):
                if #available(iOS 17.5, macCatalyst 17.5, *) {
                    impactFeedbackGenerator.prepare()
                    impactFeedbackGenerator.impactOccurred(intensity: 0.4, at: coordinate)
                }
                
            case .medium:
                impactFeedbackGenerator.prepare()
                impactFeedbackGenerator.impactOccurred(intensity: 0.6)
                
            case .mediumAt(let coordinate):
                if #available(iOS 17.5, macCatalyst 17.5, *) {
                    impactFeedbackGenerator.prepare()
                    impactFeedbackGenerator.impactOccurred(intensity: 0.6, at: coordinate)
                }
                
            case .rigid:
                impactFeedbackGenerator.prepare()
                impactFeedbackGenerator.impactOccurred(intensity: 0.75)
                
            case .rigidAt(let coordinate):
                if #available(iOS 17.5, macCatalyst 17.5, *) {
                    impactFeedbackGenerator.prepare()
                    impactFeedbackGenerator.impactOccurred(intensity: 0.75, at: coordinate)
                }
                
            case .soft:
                impactFeedbackGenerator.prepare()
                impactFeedbackGenerator.impactOccurred(intensity: 0.25)
                
            case .softAt(let coordinate):
                if #available(iOS 17.5, macCatalyst 17.5, *) {
                    impactFeedbackGenerator.prepare()
                    impactFeedbackGenerator.impactOccurred(intensity: 0.25, at: coordinate)
                }
                
            case .selectionChange:
                selectionChangeFeedbackGenerator.prepare()
                selectionChangeFeedbackGenerator.selectionChanged()
                
            case .selectionChangeAt(let coordinate):
                if #available(iOS 17.5, macCatalyst 17.5, *) {
                    selectionChangeFeedbackGenerator.prepare()
                    selectionChangeFeedbackGenerator.selectionChanged(at: coordinate)
                }
                
            case .success:
                notificationFeedbackGenerator.prepare()
                notificationFeedbackGenerator.notificationOccurred(.success)
                
            case .successAt(let coordinate):
                if #available(iOS 17.5, macCatalyst 17.5, *) {
                    notificationFeedbackGenerator.prepare()
                    notificationFeedbackGenerator.notificationOccurred(.success, at: coordinate)
                }
                
            case .warning:
                notificationFeedbackGenerator.prepare()
                notificationFeedbackGenerator.notificationOccurred(.warning)
                
            case .warningAt(let coordinate):
                if #available(iOS 17.5, macCatalyst 17.5, *) {
                    notificationFeedbackGenerator.prepare()
                    notificationFeedbackGenerator.notificationOccurred(.warning, at: coordinate)
                }
                
            case .error:
                notificationFeedbackGenerator.prepare()
                notificationFeedbackGenerator.notificationOccurred(.error)
                
            case .errorAt(let coordinate):
                if #available(iOS 17.5, macCatalyst 17.5, *) {
                    notificationFeedbackGenerator.prepare()
                    notificationFeedbackGenerator.notificationOccurred(.error, at: coordinate)
                }
                
            case .alignmentOccurredAt(let coordinate):
                if #available(iOS 17.5, macCatalyst 17.5, *) {
                    canvasFeedbackGenerator.prepare()
                    canvasFeedbackGenerator.alignmentOccurred(at: coordinate)
                }
                
            case .pathCompletedAt(let coordinate):
                if #available(iOS 17.5, macCatalyst 17.5, *) {
                    canvasFeedbackGenerator.prepare()
                    canvasFeedbackGenerator.pathCompleted(at: coordinate)
                }
        }
        #endif
    }
}

// MARK: - Factory Initializer
#if DEBUG
extension CustomHapticGenerator {
    
    /// Returns a new, isolated instance of `CustomHapticGenerator` for testing purposes.
    ///
    /// - Returns: A fresh `CustomHapticGenerator` instance, separate from the shared singleton.
    ///
    /// Use this method in tests.
    internal static func mock() -> CustomHapticGenerator {
        CustomHapticGenerator()
    }
}
#endif
