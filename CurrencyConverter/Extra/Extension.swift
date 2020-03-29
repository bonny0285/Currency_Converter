//
//  Extension.swift
//  CurrencyConverter
//
//  Created by Massimiliano on 29/03/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import Foundation


extension Double {
    func twoDecimalNumbers(place: Int) -> Double{
        let divisor = pow(10.0, Double(place))
        return (self * divisor).rounded() / divisor
    }
}
