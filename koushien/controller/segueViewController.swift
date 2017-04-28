//
//  segueViewController.swift
//  koushien
//
//  Created by naya saito on 2015/08/27.
//  Copyright (c) 2015年 naya saito. All rights reserved.
//

import UIKit

class segueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if number == ("number") {
            let targetView2: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "welcome" )
            self.present( targetView2 as! UIViewController, animated: true, completion: nil)
        }
        else {
            let targetView: AnyObject = self.storyboard!.instantiateViewController( withIdentifier: "welcome2" )
            self.present( targetView as! UIViewController, animated: true, completion: nil)
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
