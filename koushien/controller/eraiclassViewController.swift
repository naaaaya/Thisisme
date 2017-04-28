//
//  eraiclassViewController.swift
//  koushien
//
//  Created by naya saito on 2015/08/23.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit

class eraiclassViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var textField: UITextField!
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBOutlet var order: UILabel!
    var myclass : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        let userDefaults = UserDefaults.standard
        
        // NSUserDefaultsインスタンスの生成
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let myclass : String? = userDefaults.string(forKey: "myclass")
        appDelegate.myclass = myclass
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        let myclass : String? = appDelegate.myclass
        
        textField.text = myclass
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
        userDefaults.set(textField.text,forKey: "myclass")
        userDefaults.synchronize()
        
        // キー: "saveText" , 値: "" を格納。（idは任意）
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let myclass : String? = userDefaults.string(forKey: "myclass")
        // キーが"saveText"のStringをとります
        appDelegate.myclass = myclass
        //appDelegateの変数を操作
    }
}
