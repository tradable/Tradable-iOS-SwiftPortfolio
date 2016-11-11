//
//  ViewController.swift
//  SwiftPortfolio
//
//  Created by Tradable ApS on 18/11/15.
//  Copyright © 2015 Tradable ApS. All rights reserved.
//

import UIKit

import TradableAPI

// Conforms to TradableAuthDelegate and TradableEventsDelegate
class ViewController: UIViewController, TradableAuthDelegate, TradableEventsDelegate {

    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var activateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Assign the Tradable auth delegate to self
        Tradable.sharedInstance.authDelegate = self

        // Assign the TradableEventsDelegate to self
        Tradable.sharedInstance.eventsDelegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    // Authentication delegate method callback; TradableAPI is ready to be used for certain account
    func tradableReady(for account: TradableAccount) {
        print("Tradable is READY for account: \(account)")
        
        activateButton.isHidden = true

        accountLabel.text = "You are now using " + account.displayName + "."
        accountLabel.isHidden = false

        // Start account metrics updates for this account with 2s frequency
        account.startUpdates(ofType: .metrics, withFrequency: .twoSeconds)
    }

    // Authentication delegate method callback; an error occured during authentication
    func tradableAuthenticationError(error: TradableError) {
        let message = error.errorDetails ?? error.errorDescription
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    // Events delegate method callback for account metrics
    func tradableAccountMetricsUpdated(accountMetrics: TradableAccountMetrics) {
        print(accountMetrics)
    }

    @IBAction func activateTradableTouched(_ sender: UIButton) {
        // Begins authentication flow with clientID 100007 and custom URI in system browser; will store token in keychain and use it on the next run, if possible.
        Tradable.sharedInstance.activateOrAuthenticateWith(appId: 100007, uri: "com.tradable.example3://oauth2callback")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
