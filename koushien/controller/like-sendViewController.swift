//
//  like-sendViewController.swift
//  koushien
//
//  Created by naya saito on 2015/08/28.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit

class like_sendViewController: UIViewController {

    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    let w = UIScreen.main.bounds.size.width
    override func viewWillAppear(_ animated: Bool) {
        if num == ("num") {
            
            let targetView: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "bluetooth3" )
            self.present( targetView as! UIViewController, animated: true, completion: nil)
//            let mainImageView = UIImageView()
//            mainImageView.frame = CGRectMake(20, 25, 330, 546)
//            self.view.addSubview(mainImageView)
//            let userDefaults = NSUserDefaults.standardUserDefaults()
//            let base64String:String? = userDefaults.stringForKey("profile4")
//            appDelegate.profile4 = base64String
//            
//            //BASE64の文字列をデコードしてNSDataを生成
//            let decodeBase64:NSData? = NSData(base64EncodedString:base64String!, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
//            
//            //NSDataの生成が成功していたら
////            if let decodeSuccess = decodeBase64 {
//            
//                //NSDataからUIImageを生成
//                let img = UIImage(data: decodeBase64!)
//                mainImageView.image = img
//                //結果を返却
//                
////            }
//            let button3 = UIButton(frame: CGRectMake(0, 0, 200, 30))
//            button3.setTitle("おくる", forState: .Normal)
//            button3.layer.position = CGPoint(x: w/2,y: 600)
//            button3.setTitleColor(UIColor.colorFromRGB("cc66ff", alpha:1), forState: .Normal)
//            button3.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Center
//            button3.addTarget(self, action: "button3:", forControlEvents: .TouchUpInside)
//            self.view.addSubview(button3)
//            let button4 = UIButton(frame: CGRectMake(0, 0, 200, 30))
//            button4.setTitle("もどる", forState: .Normal)
//            button4.layer.position = CGPoint(x: w/2,y: 625)
//            button4.setTitleColor(UIColor.colorFromRGB("cc66ff", alpha: 1), forState: .Normal)
//            button4.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Center
//            
//            button4.addTarget(self, action: "onClickbutton2:", forControlEvents: .TouchUpInside)
//            self.view.addSubview(button4)
//        
//            
        }else{
            let warnlabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
            warnlabel.text = ("まだつくっていません")
            warnlabel.textColor = UIColor.colorFromRGB("cc66ff", alpha: 1)
            warnlabel.layer.position = CGPoint(x: w/2,y: 200)
            warnlabel.textAlignment = NSTextAlignment.center
            self.view.addSubview(warnlabel)
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
            //表示されるテキスト
            button.setTitle("つくる", for: UIControlState())
            button.layer.position = CGPoint(x: w/2,y: 350)
            button.setTitleColor(UIColor.colorFromRGB("cc66ff", alpha: 1), for: UIControlState())
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
            
            button.addTarget(self, action: #selector(like_sendViewController.onClickbutton(_:)), for: .touchUpInside)
            self.view.addSubview(button)
//            文化祭後もどして！！
            let button2 = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 30))
            //表示されるテキスト
            button2.setTitle("もどる", for: UIControlState())
            button2.layer.position = CGPoint(x: w/2,y: 400)
            button2.setTitleColor(UIColor.colorFromRGB("cc66ff", alpha: 1), for: UIControlState())
            button2.contentHorizontalAlignment = UIControlContentHorizontalAlignment.center
            
            button2.addTarget(self, action: #selector(like_sendViewController.onClickbutton2(_:)), for: .touchUpInside)
            self.view.addSubview(button2)
        
           
        }
    }
    
    internal func onClickbutton(_ sender: UIButton){
        let targetView: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "welcome4" )
        self.present( targetView as! UIViewController, animated: true, completion: nil )
    }
    internal func onClickbutton2(_ sender: UIButton){
        let targetView: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "first" )
        self.present( targetView as! UIViewController, animated: true, completion: nil )
    }
    
//    internal func button3(sender: UIButton){
//        // ShareExtensionに渡すURLの用意
//        
//        let userDefaults = NSUserDefaults.standardUserDefaults()
//        let base64String:String? = userDefaults.stringForKey("profile4")
//        appDelegate.profile4 = base64String
//        
//        //BASE64の文字列をデコードしてNSDataを生成
//        let decodeBase64:NSData? = NSData(base64EncodedString:base64String!, options: NSDataBase64DecodingOptions.IgnoreUnknownCharacters)
//        
//        //NSDataの生成が成功していたら
//        
//        
//        //NSDataからUIImageを生成
//        let img = UIImage(data: decodeBase64!)
//        
//        //結果を返却
//        
//        let shareText = "わたしのめいしです！"
//        let shareImage = img!
//        let shareItems = [shareText,shareImage]
//        
//        // ActivityViewControllerを起動
//        let activityViewController = UIActivityViewController(activityItems:shareItems, applicationActivities: nil)
//        presentViewController(activityViewController, animated: true, completion: nil)
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
