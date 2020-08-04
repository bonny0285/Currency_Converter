//
//  CurrencyModelStruct.swift
//  CurrencyConverter
//
//  Created by Massimiliano on 28/03/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import Foundation


public class CurrencyModelClass{
    
    var base : String?
    var rates : String?
    var date : String?
    var arrayCurrency: [[String : Double]]?
    var currency : [String : Double]?
    

    
}



class CurrencyClass {
    var base: String
    var rates: String?
    var date: String
    var currency : [String : Double]?
    
    
    init(base: String, rates: String?, date: String, currency : [String : Double]?
) {
        self.base = base
        self.rates = rates
        self.date = date
        self.currency = currency
    }
}
