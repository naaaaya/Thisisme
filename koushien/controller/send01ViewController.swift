//
//  send01ViewController.swift
//  koushien
//
//  Created by naya saito on 2015/08/09.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit





class send01ViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
        let club: String? = userDefaults.string(forKey: "club")
        appDelegate.club = club
        let twitter: String? = userDefaults.string(forKey: "twitter")
        appDelegate.twitter = twitter
        let insta: String? = userDefaults.string(forKey: "insta")
        appDelegate.insta = insta
        let facebook: String? = userDefaults.string(forKey: "facebook")
        appDelegate.facebook = facebook
        

       
        view0.frame = CGRect(x: 25, y: 20, width: 330, height: 546)
        view0.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//        背景の設定
        self.view.addSubview(view0)
//        取り込む
        let base64String:String? = appDelegate.beforedit
        
            
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

        
        let clublabel = UILabel(frame: CGRect(x: 0, y: 0, width: view0.bounds.width, height: 20))
        clublabel.layer.position = CGPoint(x: 165,y: 350)
        clublabel.text = appDelegate.club
        clublabel.textAlignment = NSTextAlignment.center
        clublabel.font = UIFont(name: "Trebuchet MS", size: 17)
        view0.addSubview(clublabel)
        
        let twilabel = UILabel(frame: CGRect(x: 0, y: 0, width: view0.bounds.width, height: 20))
        twilabel.layer.position = CGPoint(x: 165,y: 400)
        twilabel.text = ("Twitter:") + appDelegate.twitter!
        twilabel.textAlignment = NSTextAlignment.center
        twilabel.font = UIFont(name: "Trebuchet MS", size: 17)
        view0.addSubview(twilabel)
        
        let instalabel = UILabel(frame: CGRect(x: 0, y: 0, width: view0.bounds.width, height: 20))
        instalabel.layer.position = CGPoint(x: 165,y: 450)
        instalabel.text = ("Instagram:") + appDelegate.insta!
        instalabel.textAlignment = NSTextAlignment.center
        instalabel.font = UIFont(name: "Trebuchet MS", size: 17)
        view0.addSubview(instalabel)
        
        let facelabel = UILabel(frame: CGRect(x: 0, y: 0, width: view0.bounds.width, height: 20))
        facelabel.layer.position = CGPoint(x: 165,y: 500)
        facelabel.text = ("Facebook:") + appDelegate.facebook!
        facelabel.textAlignment = NSTextAlignment.center
        facelabel.font = UIFont(name: "Trebuchet MS", size: 17)
        view0.addSubview(facelabel)
//        
//        let l2 = UIView(frame: CGRectMake(w/2.0, 0, 1, h))
//        l2.backgroundColor = UIColor.blackColor()
//        view.addSubview(l2)
        
//

        
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func saveButton(){
        let screenshot = view0.toImage()
        
        //画像をNSDataに変換
        let data:Data = UIImagePNGRepresentation(screenshot!)!
        
        //NSDataへの変換が成功していたら
        let pngData = data
        
        //BASE64のStringに変換する
        let encodeString:String! = pngData.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)
        
        let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        userDefaults.set(encodeString,forKey: "profile2")
        userDefaults.synchronize()
        
        // キー: "saveText" , 値: "" を格納。（idは任意）
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let profile2 : String? = userDefaults.string(forKey: "profile2")
        // キーが"saveText"のStringをとります
        appDelegate.profile2 = profile2
        //appDelegateの変数を操作
        userDefaults.set(("num"),forKey: "num")
        userDefaults.synchronize()
        num = userDefaults.string(forKey: "num")
        let targetView: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "bluetooth1" )
        self.present( targetView as! UIViewController, animated: true, completion: nil)

    }
    @IBAction func backButton(){
        let screenshot = view0.toImage()
        
        //画像をNSDataに変換
        let data:Data = UIImagePNGRepresentation(screenshot!)!
        
        //NSDataへの変換が成功していたら
        let pngData = data
        
        //BASE64のStringに変換する
        let encodeString:String! = pngData.base64EncodedString(options: NSData.Base64EncodingOptions.lineLength64Characters)
       
        let userDefaults = UserDefaults.standard
        // NSUserDefaultsインスタンスの生成
        userDefaults.set(encodeString,forKey: "profile2")
        userDefaults.synchronize()
        
        // キー: "saveText" , 値: "" を格納。（idは任意）
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        //AppDelegateのインスタンスを取得
        let profile2 : String? = userDefaults.string(forKey: "profile2")
        // キーが"saveText"のStringをとります
        appDelegate.profile2 = profile2
        //appDelegateの変数を操作
        userDefaults.set(("num"),forKey: "num")
        userDefaults.synchronize()
        num = userDefaults.string(forKey: "num")
    }
}


