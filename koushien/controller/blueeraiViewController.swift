//
//  blueeraiViewController.swift
//  koushien
//
//  Created by naya saito on 2015/09/27.
//  Copyright © 2015年 naya saito. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class blueeraiViewController: UIViewController, MCSessionDelegate, MCBrowserViewControllerDelegate
{
    
    let serviceType = "LCOC-Chat"
    var peerID: MCPeerID!
    var mcSession: MCSession!
    var mcAdvertiserAssistant: MCAdvertiserAssistant!
    var img:UIImage!
    var decodeBase64:Data?
    var browser : MCBrowserViewController!
    var appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet var mainImageView: UIImageView?
    
    
    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    
    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        
    }
    
    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL, withError error: Error?) {
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userDefaults = UserDefaults.standard
        let base64String:String? = userDefaults.string(forKey: "profile3")
        appDelegate.profile3 = base64String
        
        //BASE64の文字列をデコードしてNSDataを生成
        decodeBase64 = Data(base64Encoded:base64String!, options: NSData.Base64DecodingOptions.ignoreUnknownCharacters)
        
        img = UIImage(data: decodeBase64!)
        mainImageView?.image = img
        
        peerID = MCPeerID(displayName: UIDevice.current.name)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        mcSession.delegate = self
        
        self.browser = MCBrowserViewController(serviceType:serviceType, session:self.mcSession)
        
        self.browser.delegate = self;
        
        self.mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType:serviceType, discoveryInfo:nil, session:self.mcSession)
        
        // tell the assistant to start advertising our fabulous chat
        self.mcAdvertiserAssistant.start()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func showBrowser(_ sender: UIButton) {
        // Show the browser view controller
        self.present(self.browser, animated: true, completion: nil)
    }
    
    
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case MCSessionState.connected:
            print("Connected: \(peerID.displayName)")
            
        case MCSessionState.connecting:
            print("Connecting: \(peerID.displayName)")
            
        case MCSessionState.notConnected:
            print("Not Connected: \(peerID.displayName)")
        }
    }
    
    
    
    @IBAction func sendImage(_ img: UIImage) {
        if mcSession.connectedPeers.count > 0 {
            do {
                try mcSession.send(decodeBase64!, toPeers: mcSession.connectedPeers, with: .reliable)
                print("sendingfinished")
            } catch let error as NSError {
                let ac = UIAlertController(title: "Send error", message: error.localizedDescription, preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(ac, animated: true, completion: nil)
            }
        }
    }
    
    
    
    
    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        if let image = UIImage(data: data) {
            print("recievefinished")
            DispatchQueue.main.async {
                // do something with the image
                self.mainImageView!.image = image
                UIImageWriteToSavedPhotosAlbum(image, self, #selector(blueeraiViewController.image(_:didFinishSavingWithError:contextInfo:)), nil)
            }
        }
    }
    
    func image(_ image: UIImage, didFinishSavingWithError error: NSError!, contextInfo: UnsafeMutableRawPointer) {
        let alert = UIAlertView()
        alert.title = "保存"
        alert.message = "交換できました！"
        alert.addButton(withTitle: "OK")
        alert.show()
        
    }
    
    func startHosting(_ action: UIAlertAction!){
        mcAdvertiserAssistant = MCAdvertiserAssistant(serviceType: "hws-kb", discoveryInfo: nil, session: mcSession)
    }
    
    func joinSession(_ action: UIAlertAction!){
        let mcBrowser = MCBrowserViewController(serviceType: "hws-kb", session: mcSession)
        mcBrowser.delegate = self
        present(mcBrowser, animated: true, completion: nil)
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
