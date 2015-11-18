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
class ViewController: UIViewController, TradableAPIDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign the Tradable delegate to self
        Tradable.sharedInstance.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    //Delegate method callback; TradableAPI is ready to be used
    func tradableReady() {
        
        //Gets the current OS user
        Tradable.sharedInstance.getCurrentUser { (user, error) -> Void in
            self.nameLabel.hidden = false
            
            if let user = user {
                self.nameLabel.text = "Hi " + user.userName + "!"
            } else {
                self.nameLabel.text = error!.errorDescription
            }
        }
    }

    @IBAction func activateTradableTouched(sender: UIButton) {
        sender.hidden = true
        
        //Begins authentication flow with clientID 10007 and custom URI
        Tradable.authenticateWithAppIdAndUri(100007, uri: "com.tradable.example3://oauth2callback")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
