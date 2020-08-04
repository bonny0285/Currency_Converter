//
//  CurrencyManager.swift
//  CurrencyConverter
//
//  Created by Massimiliano Bonafede on 04/08/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


class CurrencyManager {
    
    var currencies: [String] {
        return Currencies.allCases.map { $0.rawValue }
    }
    var currency: Currencies = .blank
    
    func getCurrency(currency: String, ammount: String, completion: @escaping (CurrencyClass) -> ()) {
        let url = "https://api.exchangeratesapi.io/latest?base="
        let parameters : [String : String] = ["base" : currency]
        
        AF.request(url, method: .get, parameters: parameters).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                debugPrint("Success fetched data: ",value)
                let json: JSON = JSON(arrayLiteral: value)
                let currency = self.transformJSON(json, ammount, currency)
                completion(currency)
            case .failure(let error):
                debugPrint("Failure fetched data: ", error.localizedDescription)
            }
        }
    }
    
    
    fileprivate func transformJSON(_ json: JSON,_ ammount: String,_ currency: String) -> CurrencyClass {
        let date = "\(json[0]["date"])"
        let base = "\(json[0]["base"])"
        let rates = json[0]["rates"]
        var singleRate: [String : Double] = [:]
        
        if let ammount = Double(ammount) {
            for rate in rates {
                if let value = Double("\(rate.1)") {
                    let result = (ammount * value).twoDecimalNumbers(place: 3)
                    singleRate.updateValue(result, forKey: rate.0)
                }
            }
    }
        
        return CurrencyClass(base: base, rates: nil, date: date, currency: singleRate)
    }
    
}


extension CurrencyManager {
    
    enum Currencies: String, CaseIterable {
        case blank = "---"
        case australiaDollar = "Australia Dollar"
        case bulgariaLev = "Bulgaria Lev"
        case brazilianRreal = "Brazilian Rreal"
        case canadaDollar = "Canada Dollar"
        case switzerlandFranc = "Switzerland Franc"
        case chineseYuanRenminbi = "Chinese Yuan Renminbi"
        case czechKoruna = "Czech Koruna"
        case denmarkKrone = "Denmark Krone"
        case euro = "Euro"
        case britishPound = "British Pound"
        case hongKongDollar = "Hong Kong Dollar"
        case croatiaKuna = "Croatia Kuna"
        case hungarianForint = "Hungarian Forint"
        case indonesiaRupiah = "Indonesia Rupiah"
        case israeliShekel = "Israeli Shekel"
        case indiaRupee = "India Rupee"
        case icelandiKrona = "Icelandi Krona"
        case japanYen = "Japan Yen"
        case southCoreaWon = "South Corea Won"
        case mexicoPeso = "Mexico Peso"
        case malaysianRinggit = "Malaysian Ringgit"
        case norwayKrone = "Norway Krone"
        case newZealandDollar = "New Zealand Dollar"
        case philippinesPeso = "Philippines Peso"
        case polandZloty = "Poland Zloty"
        case romanianLeu = "Romanian Leu"
        case russiaRuble = "Russia Ruble"
        case swedenKrona = "Sweden Krona"
        case singaporeDollar = "Singapore Dollar"
        case turkishLira = "Turkish Lira"
        case unitedStatesDollar = "United States Dollar"
        case southAfricaRand = "South Africa Rand"
        
        func currencyName(_ currency: String) -> String {
            
            switch currency {
            case "---":
                return "UNKNOW"
            case "Australia Dollar":
                return "AUD"
            case "Bulgaria Lev":
                return "BGN"
            case "Brazilian Rreal":
                return "BRL"
            case "Canada Dollar":
                return "CAD"
            case "Switzerland Franc":
                return "CHF"
            case "Chinese Yuan Renminbi":
                return "CNY"
            case "Czech Koruna":
                return "CZK"
            case "Denmark Krone":
                return "DKK"
            case "Euro":
                return "EUR"
            case "British Pound":
                return "GBP"
            case "Hong Kong Dollar":
                return "HKD"
            case "Croatia Kuna":
                return "HRK"
            case "Hungarian Forint":
                return "HUF"
            case "Indonesia Rupiah":
                return "IDR"
            case "Israeli Shekel":
                return "ILS"
            case "India Rupee":
                return "INR"
            case "Icelandi Krona":
                return "ISK"
            case "Japan Yen":
                return "JPY"
            case "South Corea Won":
                return "KRW"
            case "Mexico Peso":
                return "MXN"
            case "Malaysian Ringgit":
                return "MYR"
            case "Norway Krone":
                return "NOK"
            case "New Zealand Dollar":
                return "NZD"
            case "Philippines Peso":
                return "PHP"
            case "Poland Zloty":
                return "PLN"
            case "Romanian Leu":
                return "RON"
            case "Russia Ruble":
                return "RUB"
            case "Sweden Krona":
                return "SEK"
            case "Singapore Dollar":
                return "SGD"
            case "Turkish Lira":
                return "TRY"
            case "United States Dollar":
                return "USD"
            case "South Africa Rand":
                return "ZAR"
            default:
                return "UNKNOW"
            }

        }
    }
}


