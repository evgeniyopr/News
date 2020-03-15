//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map(Locale.init)
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.image` struct is generated, and contains static references to 1 images.
  struct image {
    /// Image `placeholder`.
    static let placeholder = Rswift.ImageResource(bundle: R.hostingBundle, name: "placeholder")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "placeholder", bundle: ..., traitCollection: ...)`
    static func placeholder(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.placeholder, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `NewsTableViewCell`.
    static let newsTableViewCell = _R.nib._NewsTableViewCell()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "NewsTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.newsTableViewCell) instead")
    static func newsTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.newsTableViewCell)
    }
    #endif

    static func newsTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> NewsTableViewCell? {
      return R.nib.newsTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? NewsTableViewCell
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `NewsTableViewCell`.
    static let newsTableViewCell: Rswift.ReuseIdentifier<NewsTableViewCell> = Rswift.ReuseIdentifier(identifier: "NewsTableViewCell")

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.constans` struct is generated, and contains static references to 12 localization keys.
    struct constans {
      /// Value: 260277456153440c973959dae0a124fb
      static let apiKey = Rswift.StringResource(key: "apiKey", tableName: "Constans", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Contacts from your mail accounts
      static let labelTextContactsFromYourMailAccount = Rswift.StringResource(key: "label.text.contactsFromYourMailAccount", tableName: "Constans", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Currently the maximum number of invite emails is one
      static let errorTextMaxEmailCount = Rswift.StringResource(key: "error.text.maxEmailCount", tableName: "Constans", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Enter e-mail address
      static let textFieldInfoEnterEmailAddress = Rswift.StringResource(key: "textField.info.enterEmailAddress", tableName: "Constans", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Invite
      static let buttonTitleInvite = Rswift.StringResource(key: "button.title.invite", tableName: "Constans", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Invite new contact
      static let navigationTitleInviteNewContact = Rswift.StringResource(key: "navigation.title.InviteNewContact", tableName: "Constans", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: News
      static let titleNewsFeed = Rswift.StringResource(key: "titleNewsFeed", tableName: "Constans", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Search
      static let searchBarTextSearch = Rswift.StringResource(key: "searchBar.text.search", tableName: "Constans", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Search News
      static let searchBarPlaceholder = Rswift.StringResource(key: "searchBarPlaceholder", tableName: "Constans", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: d MMM yyyy HH:mm
      static let detailDateFormat = Rswift.StringResource(key: "detail.dateFormat", tableName: "Constans", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: ua
      static let ua = Rswift.StringResource(key: "ua", tableName: "Constans", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: yyyy-MM-dd'T'HH:mm:ssZ
      static let parseDateFormat = Rswift.StringResource(key: "parse.dateFormat", tableName: "Constans", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: 260277456153440c973959dae0a124fb
      static func apiKey(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("apiKey", tableName: "Constans", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Constans", preferredLanguages: preferredLanguages) else {
          return "apiKey"
        }

        return NSLocalizedString("apiKey", tableName: "Constans", bundle: bundle, comment: "")
      }

      /// Value: Contacts from your mail accounts
      static func labelTextContactsFromYourMailAccount(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("label.text.contactsFromYourMailAccount", tableName: "Constans", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Constans", preferredLanguages: preferredLanguages) else {
          return "label.text.contactsFromYourMailAccount"
        }

        return NSLocalizedString("label.text.contactsFromYourMailAccount", tableName: "Constans", bundle: bundle, comment: "")
      }

      /// Value: Currently the maximum number of invite emails is one
      static func errorTextMaxEmailCount(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("error.text.maxEmailCount", tableName: "Constans", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Constans", preferredLanguages: preferredLanguages) else {
          return "error.text.maxEmailCount"
        }

        return NSLocalizedString("error.text.maxEmailCount", tableName: "Constans", bundle: bundle, comment: "")
      }

      /// Value: Enter e-mail address
      static func textFieldInfoEnterEmailAddress(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("textField.info.enterEmailAddress", tableName: "Constans", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Constans", preferredLanguages: preferredLanguages) else {
          return "textField.info.enterEmailAddress"
        }

        return NSLocalizedString("textField.info.enterEmailAddress", tableName: "Constans", bundle: bundle, comment: "")
      }

      /// Value: Invite
      static func buttonTitleInvite(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("button.title.invite", tableName: "Constans", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Constans", preferredLanguages: preferredLanguages) else {
          return "button.title.invite"
        }

        return NSLocalizedString("button.title.invite", tableName: "Constans", bundle: bundle, comment: "")
      }

      /// Value: Invite new contact
      static func navigationTitleInviteNewContact(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("navigation.title.InviteNewContact", tableName: "Constans", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Constans", preferredLanguages: preferredLanguages) else {
          return "navigation.title.InviteNewContact"
        }

        return NSLocalizedString("navigation.title.InviteNewContact", tableName: "Constans", bundle: bundle, comment: "")
      }

      /// Value: News
      static func titleNewsFeed(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("titleNewsFeed", tableName: "Constans", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Constans", preferredLanguages: preferredLanguages) else {
          return "titleNewsFeed"
        }

        return NSLocalizedString("titleNewsFeed", tableName: "Constans", bundle: bundle, comment: "")
      }

      /// Value: Search
      static func searchBarTextSearch(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("searchBar.text.search", tableName: "Constans", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Constans", preferredLanguages: preferredLanguages) else {
          return "searchBar.text.search"
        }

        return NSLocalizedString("searchBar.text.search", tableName: "Constans", bundle: bundle, comment: "")
      }

      /// Value: Search News
      static func searchBarPlaceholder(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("searchBarPlaceholder", tableName: "Constans", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Constans", preferredLanguages: preferredLanguages) else {
          return "searchBarPlaceholder"
        }

        return NSLocalizedString("searchBarPlaceholder", tableName: "Constans", bundle: bundle, comment: "")
      }

      /// Value: d MMM yyyy HH:mm
      static func detailDateFormat(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("detail.dateFormat", tableName: "Constans", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Constans", preferredLanguages: preferredLanguages) else {
          return "detail.dateFormat"
        }

        return NSLocalizedString("detail.dateFormat", tableName: "Constans", bundle: bundle, comment: "")
      }

      /// Value: ua
      static func ua(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("ua", tableName: "Constans", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Constans", preferredLanguages: preferredLanguages) else {
          return "ua"
        }

        return NSLocalizedString("ua", tableName: "Constans", bundle: bundle, comment: "")
      }

      /// Value: yyyy-MM-dd'T'HH:mm:ssZ
      static func parseDateFormat(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("parse.dateFormat", tableName: "Constans", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Constans", preferredLanguages: preferredLanguages) else {
          return "parse.dateFormat"
        }

        return NSLocalizedString("parse.dateFormat", tableName: "Constans", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib {
    struct _NewsTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = NewsTableViewCell

      let bundle = R.hostingBundle
      let identifier = "NewsTableViewCell"
      let name = "NewsTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> NewsTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? NewsTableViewCell
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let bundle = R.hostingBundle
      let detailViewController = StoryboardViewControllerResource<DetailViewController>(identifier: "DetailViewController")
      let name = "Main"

      func detailViewController(_: Void = ()) -> DetailViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: detailViewController)
      }

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.main().detailViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'detailViewController' could not be loaded from storyboard 'Main' as 'DetailViewController'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}