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
    
    
    func currencyName (currency : String) -> String{
        switch currency {
        case "---":
            return "UNKNOW"
        case "AUD":
            return "Australia Dollar"
        case "BGN":
            return "Bulgaria Lev"
        case "BRL":
            return "Brazilian Rreal"
        case "CAD":
            return "Canada Dollar"
        case "CHF":
            return "Switzerland Franc"
        case "CNY":
            return "Chinese Yuan Renminbi"
        case "CZK":
            return "Czech Koruna"
        case "DKK":
            return "Denmark Krone"
        case "EUR":
            return "EUR"
        case "GBP":
            return "British Pound"
        case "HKD":
            return "Hong Kong Dollar"
        case "HRK":
            return "Croatia Kuna"
        case "HUF":
            return "Hungarian Forint"
        case "IDR":
            return "Indonesia Rupiah"
        case "ILS":
            return "Israeli Shekel"
        case "INR":
            return "India Rupee"
        case "ISK":
            return "Icelandi Krona"
        case "JPY":
            return "Japan Yen"
        case "KRW":
            return "South Corea Won"
        case "MXN":
            return "Mexico Peso"
        case "MYR":
            return "Malaysian Ringgit"
        case "NOK":
            return "Norway Krone"
        case "NZD":
            return "New Zealand Dollar"
        case "PHP":
            return "Philippines Peso"
        case "PLN":
            return "Poland Zloty"
        case "RON":
            return "Romanian Leu"
        case "RUB":
            return "Russia Ruble"
        case "SEK":
            return "Sweden Krona"
        case "SGD":
            return "Singapore Dollar"
        case "TRY":
            return "Turkish Lira"
        case "USD":
            return "United States Dollar"
        case "ZAR":
            return "South Africa Rand"
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

