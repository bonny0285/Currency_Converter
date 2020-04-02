//
//  MyAnalytics.swift
//  CurrencyConverter
//
//  Created by Massimiliano on 02/04/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import Foundation
import Firebase


public struct MyAnalytics{
    
    public static func myAnalytics(forEvent event: String,forViewController controller: UIViewController?,forText testo: String){
        Analytics.logEvent(event, parameters: [
            "name": "ViewController: \(String(describing: controller))" as NSObject,
        "full_text": testo as NSObject
        ])
    }
}
