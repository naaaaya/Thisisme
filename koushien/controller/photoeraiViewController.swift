//
//  photoeraiViewController.swift
//  koushien
//
//  Created by naya saito on 2015/08/26.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit

class photoeraiViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var pickerController = UIImagePickerController()
    @IBOutlet var mainImageView:UIImageView!
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        
        let base64String:String? = userDefaults.string(forKey: "beforedit2")
        appDelegate.beforedit2 = base64String
        
        if num2 == ("num2") {
        
        //BASE64の文字列をデコードしてNSDataを生成
        let decodeBase64:Data? = Data(base64Encoded:base64String!, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
        
        //NSDataの生成が成功していたら
        
        //NSDataからUIImageを生成
        let img = UIImage(data: decodeBase64!)
        
        //結果を返却
        
        mainImageView.image = img
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
       @IBAction func albumButton() {
        pickerController.delegate = self
        pickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(pickerController, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [AnyHashable: Any]!) {
        mainImageView.image = image
        //画像をNSDataに変換
        let data:Data = UIImagePNGRepresentation(image)!
        
        //NSDataへの変換が成功していたら
        let pngData = data
        
        //BASE64のStringに変換する
        let encodeString:String! = pngData.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)
        
        //        return encodeString
        //        return nil
        
        let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        userDefaults.set(encodeString,forKey: "beforedit2")
        userDefaults.synchronize()
        
        // キー: "saveText" , 値: "" を格納。（idは任意）
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let beforedit2 : String? = userDefaults.string(forKey: "beforedit2")
        // キーが"saveText"のStringをとります
        appDelegate.beforedit2 = beforedit2
        //appDelegateの変数を操作
        self.dismiss(animated: true, completion: nil)
        userDefaults.set("alert2",forKey: "alert2")
        userDefaults.synchronize()
        alert2 = userDefaults.string(forKey: "alert2")

        userDefaults.set("num2",forKey: "num2")
        userDefaults.synchronize()
        
        num2 = userDefaults.string(forKey: "num2")
        
    }
    @IBAction func nextButton() {
        if alert2 == ("alert2") {
            
            let targetView: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "preview2" )
            self.present( targetView as! UIViewController, animated: true, completion: nil)
        } else {
           
            
            
            let alertController = UIAlertController(title: "注意", message: "写真を選んでください", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)

        }
    }
    
}
