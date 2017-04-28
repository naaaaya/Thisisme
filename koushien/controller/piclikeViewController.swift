//
//  piclikeViewController.swift
//  koushien
//
//  Created by naya saito on 2015/08/27.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit

class piclikeViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var pickerController = UIImagePickerController()
    @IBOutlet var mainImageView:UIImageView!
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        
        let base64String:String? = userDefaults.string(forKey: "beforedit3")
        appDelegate.beforedit3 = base64String
        
        if num3 == ("num3") {
        
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
       
        //画像をNSDataに変換
        let data:Data = UIImagePNGRepresentation(image)!
        
        //NSDataへの変換が成功していたら
        let pngData = data
        
        //BASE64のStringに変換する
        let encodeString:String! = pngData.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)
        
       
        
        let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        userDefaults.set(encodeString,forKey: "beforedit3")
        userDefaults.synchronize()
        
        // キー: "saveText" , 値: "" を格納。（idは任意）
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let beforedit3 : String? = userDefaults.string(forKey: "beforedit3")
        // キーが"saveText"のStringをとります
        appDelegate.beforedit3 = beforedit3
        //appDelegateの変数を操作
        
        mainImageView.image = image
        
        self.dismiss(animated: true, completion: nil)
        userDefaults.set("alert3",forKey: "alert3")
        userDefaults.synchronize()
        alert3 = userDefaults.string(forKey: "alert3")
        userDefaults.set("num3",forKey: "num3")
        userDefaults.synchronize()
        
        num3 = userDefaults.string(forKey: "num3")
        
    }
    @IBAction func nextButton() {
        if alert3 == ("alert3") {
            
            let targetView: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "preview3" )
            self.present( targetView as! UIViewController, animated: true, completion: nil)
        }  else {
            
            let alertController = UIAlertController(title: "注意", message: "写真を選んでください", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)

                    }
    }
    
    
}
