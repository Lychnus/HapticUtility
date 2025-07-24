//
//  ContentView.swift
//  HapticUtility
//
//  Created by Tahir Anil Oghan on 24.07.2025.
//

import SwiftUI

// MARK: - Implementation
struct ContentView {
    
    @State private var selectedIndex: Int = 0
    private let hapticFeedback: HapticGenerator = InteractionTools.hapticFeedback
}

// MARK: - View
extension ContentView: View {
    
    var body: some View {
        NavigationStack {
            List {
                // MARK: - Picker: Selection Change
                Section("Selection Change") {
                    Picker("Pick an Option", selection: $selectedIndex) {
                        Text("One").tag(0)
                        Text("Two").tag(1)
                        Text("Three").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .padding(.vertical, 4)
                    .onChange(of: selectedIndex) {
                        hapticFeedback.trigger(.selectionChange)
                    }
                }
                
                // MARK: - Regular Impact
                Section("Impact Feedback") {
                    Button("Heavy") { hapticFeedback.trigger(.heavy) }
                    Button("Medium") { hapticFeedback.trigger(.medium) }
                    Button("Light") { hapticFeedback.trigger(.light) }
                    Button("Rigid") { hapticFeedback.trigger(.rigid) }
                    Button("Soft") { hapticFeedback.trigger(.soft) }
                }
                
                // MARK: - Notification
                Section("Notification Feedback") {
                    Button("Success") { hapticFeedback.trigger(.success) }
                    Button("Warning") { hapticFeedback.trigger(.warning) }
                    Button("Error") { hapticFeedback.trigger(.error) }
                }
            }
            .navigationTitle("Haptic Examples")
            .listStyle(.grouped)
        }
    }
}

// MARK: - Preview
#Preview {
    ContentView()
}
