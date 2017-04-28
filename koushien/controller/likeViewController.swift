//
//  likeViewController.swift
//  koushien
//
//  Created by naya saito on 2015/08/26.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit

class likeViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var schoolLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var clubLabel: UILabel!
    @IBOutlet var twitterLabel: UILabel!
    @IBOutlet var instaLabel: UILabel!
    @IBOutlet var facebookLabel: UILabel!
    @IBOutlet var mailLabel: UILabel!

    
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        let name : String? = appDelegate.name
        nameLabel.text = name
        // labelに表示
        
                let school : String? = appDelegate.school
        schoolLabel.text = school
        // labelに表示
        
        
        
        let year : String? = appDelegate.year
        yearLabel.text = year
        let club : String? = appDelegate.club
        clubLabel.text = club
        let twitter : String? = appDelegate.twitter
        twitterLabel.text = twitter
        let insta : String? = appDelegate.insta
        instaLabel.text = insta
        let facebook : String? = appDelegate.facebook
        facebookLabel.text = facebook
        let mail : String? = appDelegate.mail
        mailLabel.text = mail
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitButton() {
        exit(0)
    }
    
}
