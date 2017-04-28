//
//  friendcommentViewController.swift
//  koushien
//
//  Created by naya saito on 2015/08/09.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit

class friendcommentViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBOutlet var order: UILabel!
    var comment : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        
        // NSUserDefaultsインスタンスの生成
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let comment: String? = userDefaults.string(forKey: "comment")
        appDelegate.comment = comment
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        let comment : String? = appDelegate.comment
        
        textView.text = comment
        // labelに表示
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBAction func okButton() {
        let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        userDefaults.set(textView.text,forKey: "comment")
        userDefaults.synchronize()
        
        // キー: "saveText" , 値: "" を格納。（idは任意）
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let comment : String? = userDefaults.string(forKey: "comment")
        // キーが"saveText"のStringをとります
        appDelegate.comment = comment
        //appDelegateの変数を操作
        
    }

}
