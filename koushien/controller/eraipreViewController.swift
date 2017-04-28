//
//  eraipreViewController.swift
//  koushien
//
//  Created by naya saito on 2015/08/27.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit

extension UIView {
    func toImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, false,0.0)
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0.0, y: 0.0)
        self.layer.render(in: context!)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}


class eraipreViewController: UIViewController {

    let view0 = UIView()
    let view1 = UIView()
    let view2 = UIView()
    let image1 = UIImage()
    let w = UIScreen.main.bounds.size.width
    let h = UIScreen.main.bounds.size.height
    @IBOutlet var mainImageView:UIImageView!
    
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        
        // NSUserDefaultsインスタンスの生成
        //AppDelegateのインスタンスを取得
        let name: String? = userDefaults.string(forKey: "name")
        appDelegate.name = name
        let school: String? = userDefaults.string(forKey: "school")
        appDelegate.school = school
        let year: String? = userDefaults.string(forKey: "year")
        appDelegate.year = year
        let myclass: String? = userDefaults.string(forKey: "myclass")
        appDelegate.myclass = myclass
        let mail: String? = userDefaults.string(forKey: "mail")
        appDelegate.mail = mail
        
        
        
        view0.frame = CGRect(x: 25, y: 20, width: 330, height: 546)
        view0.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //        背景の設定
        self.view.addSubview(view0)
        //        取り込む
        
        let base64String:String? = userDefaults.string(forKey: "beforedit2")
        appDelegate.beforedit2 = base64String
        
        
        //BASE64の文字列をデコードしてNSDataを生成
        let decodeBase64:Data? = Data(base64Encoded:base64String!, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
        
        //NSDataの生成が成功していたら
        
        //NSDataからUIImageを生成
        let img = UIImage(data: decodeBase64!)
        
        //結果を返却
        
//        mainImageView.image = img
        

        let baseImage = UIImageView(image:img)
        baseImage.frame = CGRect(x: 115, y: 50, width: 100, height: 100)
        view0.addSubview(baseImage)
        let maskView = UIImageView(image: UIImage(named: "iconmask.png"))
        
        maskView.frame = baseImage.bounds
        
        baseImage.layer.mask = maskView.layer
        view0.addSubview(baseImage)
        
        
        
        
        let namelabel = UILabel(frame: CGRect(x: 0, y: 0, width: view0.bounds.width, height: 50))
        namelabel.layer.position = CGPoint(x: 165,y: 200)
        namelabel.text = appDelegate.name
        namelabel.textAlignment = NSTextAlignment.center
        namelabel.font = UIFont(name: "Trebuchet MS", size: 30)
        view0.addSubview(namelabel)
        //        view0に文字入れ
        let schoollabel = UILabel(frame: CGRect(x: 0, y: 0, width: view0.bounds.width, height: 20))
        schoollabel.layer.position = CGPoint(x: 165,y: 250)
        schoollabel.text = appDelegate.school
        schoollabel.textAlignment = NSTextAlignment.center
        schoollabel.font = UIFont(name: "Trebuchet MS", size: 17)
        view0.addSubview(schoollabel)
        
        
        let yearlabel = UILabel(frame: CGRect(x: 0, y: 0, width: view0.bounds.width, height: 20))
        yearlabel.layer.position = CGPoint(x: 165,y: 300)
        yearlabel.text = appDelegate.year
        yearlabel.textAlignment = NSTextAlignment.center
        yearlabel.font = UIFont(name: "Trebuchet MS", size: 17)
        view0.addSubview(yearlabel)
        
        
        let myclasslabel = UILabel(frame: CGRect(x: 0, y: 0, width: view0.bounds.width, height: 20))
        myclasslabel.layer.position = CGPoint(x: 165,y: 350)
        myclasslabel.text = appDelegate.myclass! + ("組")
        myclasslabel.textAlignment = NSTextAlignment.center
        myclasslabel.font = UIFont(name: "Trebuchet MS", size: 17)
        view0.addSubview(myclasslabel)
        
        
        
        let maillabel = UILabel(frame: CGRect(x: 0, y: 0, width: view0.bounds.width, height: 20))
        maillabel.layer.position = CGPoint(x: 165,y: 400)
        maillabel.text = appDelegate.mail
        maillabel.textAlignment = NSTextAlignment.center
        maillabel.font = UIFont(name: "Trebuchet MS", size: 17)
        view0.addSubview(maillabel)
        
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func saveButton(){
        
        let screenshot = view0.toImage()
        
        //画像をNSDataに変換
        let data:Data? = UIImagePNGRepresentation(screenshot!)
        
        //NSDataへの変換が成功していたら
        let pngData = data
        
        //BASE64のStringに変換する
        let encodeString:String! = pngData!.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)
        
        //        return encodeString
        //        return nil
        
        let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        userDefaults.set(encodeString,forKey: "profile3")
        userDefaults.synchronize()
        
        // キー: "saveText" , 値: "" を格納。（idは任意）
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let profile3 : String? = userDefaults.string(forKey: "profile3")
        // キーが"saveText"のStringをとります
        appDelegate.profile3 = profile3
        //appDelegateの変数を操作
        userDefaults.set("num2",forKey: "num2")
        userDefaults.synchronize()
        
        num2 = userDefaults.string(forKey: "num2")
        let targetView: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "bluetooth2" )
        self.present( targetView as! UIViewController, animated: true, completion: nil)

        }
    
    @IBAction func backButton(){
        
        let screenshot = view0.toImage()
                //画像をNSDataに変換
        let data:Data? = UIImagePNGRepresentation(screenshot!)
        
        //NSDataへの変換が成功していたら
        let pngData = data
        
        //BASE64のStringに変換する
        let encodeString:String! = pngData!.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)
               let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        userDefaults.set(encodeString,forKey: "profile3")
        userDefaults.synchronize()
        
        // キー: "saveText" , 値: "" を格納。（idは任意）
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let profile3 : String? = userDefaults.string(forKey: "profile3")
        // キーが"saveText"のStringをとります
        appDelegate.profile3 = profile3
        //appDelegateの変数を操作
        userDefaults.set("num2",forKey: "num2")
        userDefaults.synchronize()
        
        num2 = userDefaults.string(forKey: "num2")

    }

}
