//
//  eraipreviewViewController.swift
//  koushien
//
//  Created by naya saito on 2015/08/24.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit

class eraipreviewViewController: UIViewController {

    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var schoolLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var myclassLabel: UILabel!
    @IBOutlet var mailLabel: UILabel!
    
    
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        let name : String? = appDelegate.name
        nameLabel.text = name
        // labelに表示
        
        //        var school : String? = appDelegate.school
        let school : String? = appDelegate.school
        schoolLabel.text = school
        // labelに表示
        
        
        //        var school : String? = appDelegate.school
        //        schoolLabel.text = school
        
        let year : String? = appDelegate.year
        yearLabel.text = year
        let myclass : String? = appDelegate.myclass
        myclassLabel.text = myclass
        let mail : String? = appDelegate.mail
        mailLabel.text = mail
        
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func exitButton() {
       
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    

}
