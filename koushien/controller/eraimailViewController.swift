//
//  eraimailViewController.swift
//  koushien
//
//  Created by naya saito on 2015/08/23.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit

class eraimailViewController: UIViewController,UITextFieldDelegate {
    @IBOutlet var textField: UITextField!
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBOutlet var order: UILabel!
    var mail : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        let userDefaults = UserDefaults.standard
        
        // NSUserDefaultsインスタンスの生成
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let mail : String? = userDefaults.string(forKey: "mail")
        appDelegate.mail = mail
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        let mail : String? = appDelegate.mail
        
        textField.text = mail
        // labelに表示
        
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

    
    @IBAction func okButton() {
        let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        userDefaults.set(textField.text,forKey: "mail")
        userDefaults.synchronize()
        
        // キー: "saveText" , 値: "" を格納。（idは任意）
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let mail : String? = userDefaults.string(forKey: "mail")
        // キーが"saveText"のStringをとります
        appDelegate.mail = mail
        //appDelegateの変数を操作
    }

}
