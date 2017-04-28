//
//  extention.swift
//  koushien
//
//  Created by naya saito on 2015/08/26.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit
extension UIColor {
    class func colorFromRGB(_ rgb: String, alpha: CGFloat) -> UIColor {
        let scanner = Scanner(string: rgb)
        var rgbInt: UInt32 = 0
        scanner.scanHexInt32(&rgbInt)
        
        let r = CGFloat(((rgbInt & 0xFF0000) >> 16)) / 255.0
        let g = CGFloat(((rgbInt & 0x00FF00) >> 8)) / 255.0
        let b = CGFloat(rgbInt & 0x0000FF) / 255.0
        
        return UIColor(red: r, green: g, blue: b, alpha: alpha)
    }
}
 let userDefaults = UserDefaults.standard

var number:String? = userDefaults.string(forKey: "number")
var number2:String? = userDefaults.string(forKey: "number2")
var number3:String? = userDefaults.string(forKey: "number3")
var num:String? = userDefaults.string(forKey: "num")
var num2:String? = userDefaults.string(forKey: "num2")
var num3:String? = userDefaults.string(forKey: "num3")
var alert:String? = userDefaults.string(forKey: "alert")
var alert2:String? = userDefaults.string(forKey: "alert2")
var alert3:String? = userDefaults.string(forKey: "alert3")
