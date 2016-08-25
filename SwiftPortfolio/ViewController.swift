//
//  ViewController.swift
//  SwiftPortfolio
//
//  Created by Tradable ApS on 18/11/15.
//  Copyright © 2015 Tradable ApS. All rights reserved.
//

import UIKit

import TradableAPI

//Conforms to TradableAPIDelegate
class ViewController: UIViewController, TradableAuthDelegate {

    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var activateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign the Tradable auth delegate to self
        Tradable.sharedInstance.authDelegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Authentication delegate method callback; TradableAPI is ready to be used for certain account
    func tradableReady(forAccount: TradableAccount) {
        print("Tradable is READY for account: \(forAccount)")
        
        activateButton.hidden = true

        accountLabel.text = "You are now using " + forAccount.displayName + "."
        accountLabel.hidden = false
    }

    @IBAction func activateTradableTouched(sender: UIButton) {       
        //Begins authentication flow with clientID 100007 and custom URI in system browser; will store token in keychain and use it on the next run, if possible.
        Tradable.sharedInstance.activateOrAuthenticate(100007, uri: "com.tradable.example3://oauth2callback", webView: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
