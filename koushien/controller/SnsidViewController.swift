//
//  SnsidViewController.swift
//  koushien
//
//  Created by naya saito on 2015/08/09.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit

class SnsidViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField3: UITextField!
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBOutlet var order: UILabel!
    var twitter : String?
    var insta : String?
    var facebook: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        textField2.delegate = self
        textField3.delegate = self
        let userDefaults = UserDefaults.standard
        
        // NSUserDefaultsインスタンスの生成
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let twitter : String? = userDefaults.string(forKey: "twitter")
        appDelegate.twitter = twitter
        let insta : String? = userDefaults.string(forKey: "insta")
        appDelegate.insta = insta
        let facebook : String? = userDefaults.string(forKey: "facebook")
        appDelegate.facebook = facebook

        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        let twitter : String? = appDelegate.twitter
        
        textField.text = twitter
        // labelに表示
        let insta : String? = appDelegate.insta
        
        textField2.text = insta

        let facebook : String? = appDelegate.facebook

        textField3.text = facebook

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        
        // キーボードを閉じる
        textField.resignFirstResponder()
        
        return true
    }
    func textFieldShouldReturn2(_ textField: UITextField) -> Bool{
        
        // キーボードを閉じる
        textField2.resignFirstResponder()
        
        return true
    }
    func textFieldShouldReturn3(_ textField: UITextField) -> Bool{
        
        // キーボードを閉じる
        textField3.resignFirstResponder()
        
        return true
    }


    @IBAction func okButton() {
        let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        userDefaults.set(textField.text,forKey: "twitter")
        userDefaults.set(textField2.text,forKey: "insta")
        userDefaults.set(textField3.text,forKey: "facebook")
        userDefaults.synchronize()
        
        // キー: "saveText" , 値: "" を格納。（idは任意）
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let twitter : String? = userDefaults.string(forKey: "twitter")
        // キーが"saveText"のStringをとります
        appDelegate.twitter = twitter
        //appDelegateの変数を操作
        let insta : String? = userDefaults.string(forKey: "insta")
        // キーが"saveText"のStringをとります
        appDelegate.insta = insta
        //appDelegateの変数を操作
        
        let facebook : String? = userDefaults.string(forKey: "others")
        // キーが"saveText"のStringをとります
        appDelegate.facebook = facebook
        //appDelegateの変数を操作


        
    }

}
