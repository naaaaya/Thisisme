//
//  make01ViewController.swift
//  koushien
//
//  Created by naya saito on 2015/08/09.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit

class make01ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func friendBtn() {
        if num == ("num") {
            let targetView2: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "segue" )
            self.present( targetView2 as! UIViewController, animated: true, completion: nil)
        }
        else {
            let targetView: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "welcome2" )
            self.present( targetView as! UIViewController, animated: true, completion: nil)
            
        }

    }
    
    @IBAction func eraiBtn() {
        if num2 == ("num2") {
            let targetView2: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "segue2" )
            self.present( targetView2 as! UIViewController, animated: true, completion: nil)
        }
        else {
            let targetView: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "welcome3" )
            self.present( targetView as! UIViewController, animated: true, completion: nil)

            
        }
        
    }
    
    @IBAction func loveBtn() {
        if num3 == ("num3") {
            let targetView2: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "segue3" )
            self.present( targetView2 as! UIViewController, animated: true, completion: nil)
        }
        else {
            let targetView: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "welcome4" )
            self.present( targetView as! UIViewController, animated: true, completion: nil)
                    }
        
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
