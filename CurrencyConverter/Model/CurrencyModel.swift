//
//  CurrencyModel.swift
//  CurrencyConverter
//
//  Created by Massimiliano on 15/06/2019.
//  Copyright © 2019 Massimiliano Bonafede. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire


public struct CurrencyModel {
//MARK: - Currency Array
    public static let currencyArray = ["------","Australia Dollar","Bulgaria Lev","Brazilian Rreal","Canada Dollar","Switzerland Franc","Chinese Yuan Renminbi","Czech Koruna","Denmark Krone","Euro","British Pound","Croatia Kuna","Hungarian Forint","Indonesia Rupiah","Israeli Shekel","India Rupee","Icelandi Krona","Japan Yen","South Corea Won","Mexico Peso","Malaysian Ringgit","Norway Krone","New Zealand Dollar","Philippines Peso","Poland Zloty","Romanian Leu","Russia Ruble","Sweden Krona","Singapore Dollar","Turkish Lira","United States Dollar","South Africa Rand","------"]
    
    
//MARK: - Get Currency Name
    public static func currencyName (currency : String) -> String{
        switch currency {
        case "------":
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
            return "unknow"
        }
    }
    
//MARK: - Get Currency Data
    public static func getCurrencyData(url: String, parameters: [String:String],amount : String,currency: String, completion: @escaping (CurrencyModelClass) -> (Void)){
        
        AF.request(url, method: .get, parameters:parameters).responseJSON{
            response in
            
            switch response.result{
            case .success(let value):
                print("Success! Got the weather data")
                let currencyJSON : JSON = JSON(arrayLiteral: value)
               // print(currencyJSON)
                let myCurrency = self.getJSONObject(forJSON: currencyJSON, amount: amount, currency: currency)
                completion(myCurrency)
            case .failure(let error):
                //self.valutaDaConvertitreTxt.placeholder = "Connection Issue"
                print(error.localizedDescription)
            }
        }
    }
    
    
    static func getJSONObject(forJSON json : JSON, amount: String, currency : String) -> CurrencyModelClass{
        let date = "\(json[0]["date"])"
        let base = "\(json[0]["base"])"
        let rates = json[0]["rates"]
        var singleRate: [String : Double] = [:]
        //var arrayRate: [[String : Double]] = [[:]]
        let myCurrency = CurrencyModelClass()
  
        
            if let amount = Double(amount){
                for i in rates{
                    if let value = Double("\(i.1)"){
                        let risultato = (amount * value).twoDecimalNumbers(place: 3)
                        singleRate.updateValue(risultato, forKey: i.0)
                    }
                }
            }
   

        
        myCurrency.currency = singleRate
        myCurrency.base = base
        myCurrency.date = date
        //myCurrency.arrayCurrency = arrayRate

        return myCurrency
    }
    
    
    
    
    //MARK: - Currency Flag
   public static func currencyFlag (currency : String) -> String{
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

    
    
    //MARK: - Currency Name
    public static func currencyGetNameCurrency (currency : String) -> String{
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
                return "Euro"
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

    
}
