//
//  Language.swift
//  NewsList
//
//  Created by Rajender Sharma on 19/06/20.
//

import Foundation

/// Language
class Language {

	/// get current Apple language
	class func currentAppleLanguage() -> String {
		let userDefault = UserDefaults.standard
		let langArray = userDefault.object(forKey: APPLE_LANGUAGE_KEY) as! NSArray
		let current = langArray.firstObject as! String
		return current
	}

	/// set @lang to be the first in Applelanguages list
	class func setAppleLAnguageTo(lang: String) {
		let userDefault = UserDefaults.standard
		userDefault.set([lang,currentAppleLanguage()], forKey: APPLE_LANGUAGE_KEY)
		userDefault.synchronize()
	}
}
