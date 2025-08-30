# AppIntentsLocalizationBug
App Intents declared in Swift Packages are not able to be localized with string catalogs included in the same package.

### Intents not using package localization
There are intents declared in "AppIntentsModule" Swift Package, along with the string catalog containing localization for all respective types (such as "SomeAppEnum" and "SomeAppIntent"). The localization keys are extracted correctly, but when running the app, SPM intent types are not localized. Localization keys declared in the main app target are working as expected - "AppShortcuts.xcstrings" extract App Shortcut phrases and they are working fine; "Localizable.xcstrings.bak" has two keys extracted, one of which was seemingly extracted from the SPM ("SomeAppIntent.ParameterSummary ${someAppEnum}"). iOS uses the localization for that key from the main bundle, but does not use the translation included in the SPM.

### Having to create a separate AppIntentsExtension for intents to show up in the system
Target "AppIntentsExtension" has to be bundled with the main app and it has to declare `AppIntentsPackage` for intents to be discovered. When the extension does not exist, even when `AppIntentsPackage` is defined in the main app, intents will not show up in the system. They are visible in "Metadata.appintents", but you cannot find them in iOS. When running the intent, it is launched via the main app anyways, so the role of the extension is to just mention other packages. I feel like it shouldn't work this way?
