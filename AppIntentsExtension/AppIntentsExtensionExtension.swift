//
//  AppIntentsExtensionExtension.swift
//  AppIntentsExtension
//
//  Created by royal on 30/08/2025.
//

import AppIntents
import AppIntentsModule
import ExtensionFoundation

/// This `AppIntentsExtension` has to exist, because otherwise the intents don't appear at all.
@main
struct AppIntentsExtensionExtension: AppIntentsExtension {}

/// This needs to be here so that SPM intents get discovered.
extension AppIntentsExtensionExtension: AppIntentsPackage {
	static let includedPackages: [any AppIntentsPackage.Type] = [
		AppIntentsModule.self
	]
}
