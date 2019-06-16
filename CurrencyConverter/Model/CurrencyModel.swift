//
//  CurrencyModel.swift
//  CurrencyConverter
//
//  Created by Massimiliano on 15/06/2019.
//  Copyright © 2019 Massimiliano Bonafede. All rights reserved.
//

import Foundation


class Currency : NSObject {
    
    var base : String = ""
    var rates : String = ""
    var date : String = ""
    
    
    var BGN : Double = 0.0
    var NZD : Double = 0.0
    var ILS : Double = 0.0
    var RUB : Double = 0.0
    var CAD : Double = 0.0
    var USD : Double = 0.0
    var PHP : Double = 0.0
    var CHF : Double = 0.0
    var AUD : Double = 0.0
    var JPY : Double = 0.0
    var TRY : Double = 0.0
    var HKD : Double = 0.0
    var MYR : Double = 0.0
    var HRK : Double = 0.0
    var CZK : Double = 0.0
    var IDR : Double = 0.0
    var DKK : Double = 0.0
    var NOK : Double = 0.0
    var HUF : Double = 0.0
    var GBP : Double = 0.0
    var MXN : Double = 0.0
    var THB : Double = 0.0
    var ISK : Double = 0.0
    var ZAR : Double = 0.0
    var BRL : Double = 0.0
    var SGD : Double = 0.0
    var PLN : Double = 0.0
    var INR : Double = 0.0
    var KRW : Double = 0.0
    var RON : Double = 0.0
    var CNY : Double = 0.0
    var SEK : Double = 0.0
    var EUR : Double = 0.0
    
}
    
    
    func currencyFinder (currency : String) -> String{
        switch currency {
        case "---":
            return "UNKNOW"
        case "AUD":
            return "AUD"
        case "BGN":
            return "BGN"
        case "BRL":
            return "BRL"
        case "CAO":
            return "CAO"
        case "CHF":
            return "CHF"
        case "CNY":
            return "CNY"
        case "CZK":
            return "CZK"
        case "DKK":
            return "DKK"
        case "EUR":
            return "EUR"
        case "GBP":
            return "GBP"
        case "HKD":
            return "HKD"
        case "HRK":
            return "HRK"
        case "HUF":
            return "HUF"
        case "IDR":
            return "IDR"
        case "ILS":
            return "ILS"
        case "INR":
            return "INR"
        case "ISK":
            return "ISK"
        case "JPY":
            return "JPY"
        case "KRW":
            return "KRW"
        case "MXN":
            return "MXN"
        case "MYR":
            return "MYR"
        case "NOK":
            return "NOK"
        case "NZD":
            return "NZD"
        case "PHP":
            return "PHP"
        case "PLN":
            return "PLN"
        case "RON":
            return "RON"
        case "RUB":
            return "RUB"
        case "SEK":
            return "SEK"
        case "SGD":
            return "SGD"
        case "TRY":
            return "TRY"
        case "USD":
            return "USD"
        case "ZAR":
            return "ZAR"
        default:
            return "unknow"
        }
    }


func currencyFlag (currency : String) -> String{
    switch currency {
    case "---":
        return "UNKNOW"
    case "AUD":
        return "AUD"
    case "BGN":
        return "BGN"
    case "BRL":
        return "BRL"
    case "CAO":
        return "CAO"
    case "CHF":
        return "CHF"
    case "CNY":
        return "CNY"
    case "CZK":
        return "CZK"
    case "DKK":
        return "DKK"
    case "EUR":
        return "EUR"
    case "GBP":
        return "GBP"
    case "HKD":
        return "HKD"
    case "HRK":
        return "HRK"
    case "HUF":
        return "HUF"
    case "IDR":
        return "IDR"
    case "ILS":
        return "ILS"
    case "INR":
        return "INR"
    case "ISK":
        return "ISK"
    case "JPY":
        return "JPY"
    case "KRW":
        return "KRW"
    case "MXN":
        return "MXN"
    case "MYR":
        return "MYR"
    case "NOK":
        return "NOK"
    case "NZD":
        return "NZD"
    case "PHP":
        return "PHP"
    case "PLN":
        return "PLN"
    case "RON":
        return "RON"
    case "RUB":
        return "RUB"
    case "SEK":
        return "SEK"
    case "SGD":
        return "SGD"
    case "TRY":
        return "TRY"
    case "USD":
        return "USD"
    case "ZAR":
        return "ZAR"
    default:
        return "unknow"
    }
}

