import AppIntents

public struct AppIntentsModule: AppIntentsPackage {}

public enum SomeAppEnum: String, AppEnum {
	public static let typeDisplayRepresentation: TypeDisplayRepresentation = "SomeAppEnum.TypeDisplayRepresentation" // Extracted, not localized

	public static let caseDisplayRepresentations: [SomeAppEnum: DisplayRepresentation] = [
		.lawnmower: .init(
			title: "SomeAppEnum.Lawnmower.Title",	// Extracted, not localized
			image: .init(named: "lawnmower")		// Bundled in Media.xcassets (SPM), but does not pop up anywhere
		)
	]

	case lawnmower
}

public struct SomeAppIntent: AppIntent {
	public static let title: LocalizedStringResource = "SomeAppIntent.Title"// Extracted, not localized

	public static var parameterSummary: some ParameterSummary {
		Summary("SomeAppIntent.ParameterSummary \(\.$someAppEnum)") // Extracted in both main target and SPM, uses localization from the main target.
	}

	@Parameter(title: "SomeAppEnum.TypeDisplayRepresentation") // Extracted, not localized
	public var someAppEnum: SomeAppEnum?

	public init() {}

	public init(someAppEnum: SomeAppEnum?) {
		self.someAppEnum = someAppEnum
	}

	public func perform() async throws -> some IntentResult & ProvidesDialog {
		guard someAppEnum != nil else {
			throw $someAppEnum.needsValueError()
		}
		
		try await Task.sleep(for: .seconds(2))
		return .result(
			dialog: .init(
				full: "SomeAppIntent.Dialog.Full",				// Extracted, not localized
				supporting: "SomeAppIntent.Dialog.Supporting"	// Extracted, not localized
			)
		)
	}
}
