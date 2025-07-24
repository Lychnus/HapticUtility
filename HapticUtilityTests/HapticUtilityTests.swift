//
//  HapticUtilityTests.swift
//  HapticUtilityTests
//
//  Created by Tahir Anil Oghan on 24.07.2025.
//

import Foundation
import Testing
@testable import HapticUtility

@Suite("CustomHapticUtility Tests")
struct HapticUtilityTests {
    
    // MARK: - HapticGeneratorFeedback Tests
    
    @Test("All feedback cases can be created correctly.")
    func allFeedbackCasesCanBeCreated() {
        let testPoint = CGPoint.zero
        
        let feedbacks: [HapticGeneratorFeedback] = [
            .heavy,
            .heavyAt(testPoint),
            .light,
            .lightAt(testPoint),
            .medium,
            .mediumAt(testPoint),
            .rigid,
            .rigidAt(testPoint),
            .soft,
            .softAt(testPoint),
            .selectionChange,
            .selectionChangeAt(testPoint),
            .success,
            .successAt(testPoint),
            .warning,
            .warningAt(testPoint),
            .error,
            .errorAt(testPoint),
            .alignmentOccurredAt(testPoint),
            .pathCompletedAt(testPoint)
        ]
        
        #expect(feedbacks.count == 20)
    }
    
    // MARK: - CustomHapticGenerator Tests
    
    @Test("Trigger basic feedback types works correctly without crashing.")
    func triggerBasicFeedbackTypes() {
        let hapticGenerator = CustomHapticGenerator.mock()
        
        // These tests verify that the trigger method doesn't crash
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.heavy)
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.light)
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.medium)
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.rigid)
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.soft)
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.selectionChange)
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.success)
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.warning)
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.error)
        }
    }

    @Test("Trigger coordinate-based feedback types works correctly without crashing.")
    func triggerCoordinateBasedFeedbackTypes() {
        let hapticGenerator = CustomHapticGenerator.mock()
        let testPoint = CGPoint.zero
        
        // These require iOS 17.5+, but should not crash on earlier versions
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.heavyAt(testPoint))
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.lightAt(testPoint))
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.mediumAt(testPoint))
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.rigidAt(testPoint))
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.softAt(testPoint))
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.selectionChangeAt(testPoint))
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.successAt(testPoint))
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.warningAt(testPoint))
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.errorAt(testPoint))
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.alignmentOccurredAt(testPoint))
        }
        #expect(throws: Never.self) {
            hapticGenerator.trigger(.pathCompletedAt(testPoint))
        }
    }
}
