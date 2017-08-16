//
//  ViewController.swift
//  Localization-05-08-2017
//
//  Created by Soeng Saravit on 8/5/17.
//  Copyright © 2017 Soeng Saravit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changLanguageButton: UIButton!
    var welcomeLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        changLanguageButton.setTitle("kh-button".localized, for: .normal)
        welcomeLabel = UILabel(frame: CGRect(x: 150, y: 100, width: 100, height: 20))
        welcomeLabel.text = "Welcome".localized
        
        //Change Language for Tab Bar
        self.tabBarController?.tabBar.items?[0].title = "Home".localized
        self.tabBarController?.tabBar.items?[1].title = "Setting".localized
       
        self.view.addSubview(welcomeLabel)
    }

    @IBAction func changeLanguageButtonClicked(_ sender: Any){
        if UserDefaults.standard.string(forKey: "LanguageCode") == "en" {
            LanguageManager.shared.language = "km"
            UserDefaults.standard.set(["km"], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        }else if UserDefaults.standard.string(forKey: "LanguageCode") == "km"{
            LanguageManager.shared.language = "en"
            UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
            UserDefaults.standard.synchronize()
        }
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let homeCotroller = storyBoard.instantiateInitialViewController()
        appDelegate.window?.rootViewController = homeCotroller
    }
}

