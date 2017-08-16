//
//  LanguageManager.swift
//  Localization-05-08-2017
//
//  Created by Soeng Saravit on 8/5/17.
//  Copyright © 2017 Soeng Saravit. All rights reserved.
//

import Foundation

class LanguageManager {
    //Shared Instance
    static let shared = LanguageManager()
    
    private init(){}
    
    //Compute property
    var language:String {
        set {
            UserDefaults.standard.set(newValue, forKey: "LanguageCode")
            UserDefaults.standard.synchronize()
        }
        get {
            if let data = UserDefaults.standard.string(forKey: "LanguageCode") {
                let languageCode = data.lowercased()
                return languageCode
            }else {
                return self.language
            }
        }
    }
}

extension String {
    var localized:String {
        get {
            if let data = UserDefaults.standard.string(forKey: "LanguageCode") {
                let languageCode = data.lowercased()
                
                let bundlePath = Bundle.main.path(forResource: languageCode, ofType: "lproj")
                print(bundlePath!)
                
                let languageBundle = Bundle(path: bundlePath!)
                
                var translateString = languageBundle?.localizedString(forKey: self, value: "", table: nil)
                
                if (translateString?.characters.count)! < 1 {
                    translateString = NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: self, comment: self)
                }
                return translateString!
                
            }else{
                return ""
            }
        }
    }
}
