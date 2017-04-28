//
//  photofriendViewController.swift
//  koushien
//
//  Created by naya saito on 2015/08/26.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit


class photofriendViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var pickerController = UIImagePickerController()
    @IBOutlet var mainImageView:UIImageView!
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        //        super.viewWillAppear()
        
        autoreleasepool{
            let userDefaults = UserDefaults.standard
            
            let base64String:String? = userDefaults.string(forKey: "beforedit")
            appDelegate.beforedit = base64String
            
            appDelegate.test = "テスト１"
            
            if num == ("num") {
                
                //BASE64の文字列をデコードしてNSDataを生成
                let decodeBase64:Data? = Data(base64Encoded:base64String!, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
                
                //NSDataの生成が成功していたら
                
                //NSDataからUIImageを生成
                let img = UIImage(data: decodeBase64!)
                
                //結果を返却
                
                mainImageView.image = img
            }
        }
        
        // Do any additional setup after loading the view.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func albumButton() {
        autoreleasepool {
            var img = mainImageView.image
            pickerController.delegate = self
            pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
            self.present(pickerController, animated: true, completion: nil)
            //        for _ in 0...100000 {
            //            autoreleasepool{
            //
            //            let image = UIImage(named: "iconmask.png")
            //            }
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [AnyHashable: Any]!) {
        mainImageView.image = image
        //画像をNSDataに変換
        autoreleasepool {
            
            let data:Data = UIImagePNGRepresentation(image)!
            
            //NSDataへの変換が成功していたら
            let pngData = data
            
            //BASE64のStringに変換する
            
            
            let encodeString:String! = pngData.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)
            
            //        return encodeString
            //        return nil
            
            let userDefaults = UserDefaults.standard
            // NSUserDefaultsインスタンスの生成
            userDefaults.set(encodeString,forKey: "beforedit")
            userDefaults.synchronize()
            
            // キー: "saveText" , 値: "" を格納。（idは任意）
            let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
            //AppDelegateのインスタンスを取得
            let beforedit : String? = userDefaults.string(forKey: "beforedit")
            // キーが"saveText"のStringをとります
            appDelegate.beforedit = beforedit
            //appDelegateの変数を操作
            self.dismiss(animated: true, completion: nil)
            userDefaults.set("alert",forKey: "alert")
            userDefaults.synchronize()
            alert = userDefaults.string(forKey: "alert")
        }
    }
    
    @IBAction func nextButton() {
        if alert == ("alert") {
            
            let targetView: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "preview" )
            self.present( targetView as! UIViewController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "注意", message: "写真を選んでください", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
            
            
        }
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        appDelegate.test = "テスト"
        
        
    }
}
