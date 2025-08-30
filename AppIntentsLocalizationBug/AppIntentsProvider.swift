//
//  AppIntentsProvider.swift
//  AppIntentsLocalizationBug
//
//  Created by royal on 30/08/2025.
//

import AppIntents
import AppIntentsModule

struct AppIntentsProvider {}

/// This does not work :(
//extension AppIntentsProvider: AppIntentsPackage {
//	static let includedPackages: [any AppIntentsPackage.Type] = [
//		AppIntentsModule.self
//	]
//}

/// This needs to be here anyways, so that App Shortcuts appear.
extension AppIntentsProvider: AppShortcutsProvider {
	@AppShortcutsBuilder
	static var appShortcuts: [AppShortcut] {
		AppShortcut(
			intent: SomeAppIntent(),
			phrases: [
				"Do something in \(.applicationName)",
				"Do something with \(\.$someAppEnum) in \(.applicationName)"
			],
			shortTitle: "AppShortcuts.SomeAppIntent.ShortTitle",
			systemImageName: "xmark"
		)
	}
}
