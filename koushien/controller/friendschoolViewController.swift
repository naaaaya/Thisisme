//
//  friendschoolViewController.swift
//  koushien
//
//  Created by naya saito on 2015/08/09.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit

class friendschoolViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var textField: UITextField!
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBOutlet var order: UILabel!
    var school : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        let userDefaults = UserDefaults.standard
        
        // NSUserDefaultsインスタンスの生成
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let school : String? = userDefaults.string(forKey: "school")
        appDelegate.school = school
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        let school : String? = appDelegate.school
        
        textField.text = school
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
        userDefaults.set(textField.text,forKey: "school")
        userDefaults.synchronize()
        
        // キー: "saveText" , 値: "" を格納。（idは任意）
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let school : String? = userDefaults.string(forKey: "school")
        // キーが"saveText"のStringをとります
        appDelegate.school = school
        //appDelegateの変数を操作
        
    }
}
