//
//  ViewController.swift
//  ios
//
//  Created by codefin3 on 3/28/19.
//  Copyright © 2019 codefin3. All rights reserved.
//

import UIKit
import React

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func thebutton(_ sender: Any) {
        NSLog("Hello")
        let providerSettings = RCTBundleURLProvider.sharedSettings() // release
        let jsCodeLocation = providerSettings?.jsBundleURL(forBundleRoot: "main.jsbundle", fallbackResource: nil) // release
        //  let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios") // debug
        let mockData:NSDictionary = ["scores":
            [
                ["name":"Alex", "value":"42"],
                ["name":"Joel", "value":"10"]
            ]
        ]
        
        let rootView = RCTRootView(
            bundleURL: jsCodeLocation,
            moduleName: "RNHighScores",
            initialProperties: mockData as [NSObject : AnyObject],
            launchOptions: nil
        )
        let vc = UIViewController()
        vc.view = rootView
        self.present(vc, animated: true, completion: nil)
        
    }
}

