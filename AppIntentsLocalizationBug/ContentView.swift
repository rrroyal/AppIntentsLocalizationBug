//
//  ContentView.swift
//  AppIntentsLocalizationBug
//
//  Created by royal on 30/08/2025.
//

import AppIntents
import AppIntentsModule
import SwiftUI

struct ContentView: View {
    var body: some View {
		VStack {
			SiriTipView(intent: SomeAppIntent())
			Button(intent: SomeAppIntent(someAppEnum: .lawnmower)) {
				Text(verbatim: "Intent")
			}
		}
		.padding()
    }
}

#Preview {
    ContentView()
}
