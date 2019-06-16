//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Massimiliano on 15/06/2019.
//  Copyright © 2019 Massimiliano Bonafede. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class CurrencyVC: UIViewController {

    var pickerData : [String] = ["---","BGN","NZD","ILS","RUB","CAD","USD","PHP","CHF","AUD","JPY","TRY","HKD","MYR","HRK","CZK","IDR","DKK","NOK","HUF","GBP","MXN","THB","ISK","ZAR","BRL","SGD","PLN","INR","KRW","RON","CNY","SEK","EUR"].sorted()
    let currency = Currency()
    let MY_URL = "https://api.exchangeratesapi.io/latest?"
    var valuta : String = ""
    var myCurrency : [Double] = []
    var myCurrencyDict : [String : Double] = [:]
    
    
    @IBOutlet weak var valutaDaConvertitreTxt: UITextField!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currencyBaseLbl: UILabel!
    @IBOutlet weak var currencyTableView: UITableView!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        currencyTableView.dataSource = self
        currencyTableView.delegate = self
        currencyTableView.reloadData()
        //startJSON()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        currencyTableView.delegate = self
        currencyTableView.dataSource = self
        tapGestureRecognize()
    }
    
    
//    func startJSON (){
//        let params : [String : String] = ["base" : valuta]
//        getWeatherData(url: MY_URL, parameters: params)
//    }
    
    
    func getWeatherData(url: String, parameters: [String:String]){
        Alamofire.request(url, method: .get, parameters:parameters).responseJSON{
            response in
            if response.result.isSuccess{
                //print(response.request?.description)
                print("Success! Got the weather data")
                let currencyJSON : JSON = JSON(response.result.value!)
                print(currencyJSON)
                self.updateCurrency(json: currencyJSON)
            }
            else{
                print("Error \(String(describing: response.result.error))")
                // self.locationLbl.text = "Connection Issue"
            }
        }
    }
    
    
    func updateCurrency(json : JSON){
        let rates = json["rates"].stringValue
        print("RATES",rates.count)
        let base = json["base"].stringValue
        currencyBaseLbl.text = "Currency base : \(base)"
        let date = json["date"].stringValue
        myCurrency = []
        myCurrencyDict = [:]
        
        let eur = json["rates"]["EUR"].doubleValue
        myCurrency.append(eur)
        myCurrencyDict["EUR"] = eur
        
        let ron = json["rates"]["RON"].doubleValue
         myCurrency.append(ron)
        myCurrencyDict["RON"] = ron
        
        
        let trys = json["rates"]["TRY"].doubleValue
         myCurrency.append(trys)
        myCurrencyDict["TRY"] = trys 
        
        let zar = json["rates"]["ZAR"].doubleValue
         myCurrency.append(zar)
        myCurrencyDict["ZAR"] = zar
        
        let php = json["rates"]["PHP"].doubleValue
         myCurrency.append(php)
        myCurrencyDict["PHP"] = php
        
        let myr = json["rates"]["MYR"].doubleValue
         myCurrency.append(myr)
        myCurrencyDict["MYR"] = myr
        
        let mxn = json["rates"]["MXN"].doubleValue
         myCurrency.append(mxn)
        myCurrencyDict["MXN"] = mxn
        
        let hrk = json["rates"]["HRK"].doubleValue
         myCurrency.append(hrk)
        myCurrencyDict["HRK"] = hrk
        
        let aud = json["rates"]["AUD"].doubleValue
         myCurrency.append(aud)
        myCurrencyDict["AUD"] = aud
        
        let thb = json["rates"]["THB"].doubleValue
         myCurrency.append(thb)
        myCurrencyDict["THB"] = thb
        
        let usd = json["rates"]["USD"].doubleValue
         myCurrency.append(usd)
        myCurrencyDict["USD"] = usd
        
        let idr = json["rates"]["IDR"].doubleValue
         myCurrency.append(idr)
        myCurrencyDict["IDR"] = idr
        
        let jpy = json["rates"]["JPY"].doubleValue
         myCurrency.append(jpy)
        myCurrencyDict["JPY"] = jpy
        
        let huf = json["rates"]["HUF"].doubleValue
         myCurrency.append(huf)
        myCurrencyDict["HUF"] = huf
        
        let cny = json["rates"]["CNY"].doubleValue
         myCurrency.append(cny)
        myCurrencyDict["CNY"] = cny
        
        let dkk = json["rates"]["DKK"].doubleValue
         myCurrency.append(dkk)
        myCurrencyDict["DKK"] = dkk
        
        let hkd = json["rates"]["HKD"].doubleValue
         myCurrency.append(hkd)
        myCurrencyDict["HKD"] = hkd
        
        let inr = json["rates"]["INR"].doubleValue
         myCurrency.append(inr)
        myCurrencyDict["INR"] = inr
        
        let rub = json["rates"]["RUB"].doubleValue
         myCurrency.append(rub)
        myCurrencyDict["RUB"] = rub
        
        let bgn = json["rates"]["BGN"].doubleValue
         myCurrency.append(bgn)
        myCurrencyDict["BGN"] = bgn
        
        let gbp = json["rates"]["GBP"].doubleValue
         myCurrency.append(gbp)
        myCurrencyDict["GBP"] = gbp
        
        let pln = json["rates"]["PLN"].doubleValue
         myCurrency.append(pln)
        myCurrencyDict["PLN"] = pln
        
        let chf = json["rates"]["CHF"].doubleValue
         myCurrency.append(chf)
        myCurrencyDict["CHF"] = chf
        
        let nok = json["rates"]["NOK"].doubleValue
         myCurrency.append(nok)
        myCurrencyDict["NOK"] = nok
        
        let brl = json["rates"]["BRL"].doubleValue
         myCurrency.append(brl)
        myCurrencyDict["BRL"] = brl
        
        let ils = json["rates"]["ILS"].doubleValue
         myCurrency.append(ils)
        myCurrencyDict["ILS"] = ils
        
        let cad = json["rates"]["CAD"].doubleValue
         myCurrency.append(cad)
        myCurrencyDict["CAD"] = cad
        
        let sgd = json["rates"]["SGD"].doubleValue
         myCurrency.append(sgd)
        myCurrencyDict["SGD"] = sgd
        
        let czk = json["rates"]["CZK"].doubleValue
         myCurrency.append(czk)
        myCurrencyDict["CZK"] = czk
        
        let isk = json["rates"]["ISK"].doubleValue
         myCurrency.append(isk)
        myCurrencyDict["ISK"] = isk
        
        let nzd = json["rates"]["NZD"].doubleValue
         myCurrency.append(nzd)
        myCurrencyDict["NZD"] = nzd
        
        let krw = json["rates"]["KRW"].doubleValue
         myCurrency.append(krw)
        myCurrencyDict["KRW"] = krw
        
        let sek = json["rates"]["SEK"].doubleValue
         myCurrency.append(sek)
        myCurrencyDict["SEK"] = sek
        
        print("cazzooo", myCurrency)
        print(base)
        print(date)
        print(eur)
        currencyTableView.reloadData()

    }
    
    
    
    
    func tapGestureRecognize(){
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(rimuoviTastiera))
        view.addGestureRecognizer(tap)
    }
    
    @objc func rimuoviTastiera(){
        self.view.endEditing(true)
    }
    
}



extension CurrencyVC : UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        //valuta = pickerData[row]
        tapGestureRecognize()
        self.view.endEditing(true)
        valuta = currencyFinder(currency: pickerData[row])
        print("VALUTA", valuta)
        if valuta != "Unknow" || valuta != ""{
        let params : [String : String] = ["base" : valuta]
        getWeatherData(url: MY_URL, parameters: params)
        currencyTableView.reloadData()
            print("VEDIAMO", myCurrencyDict)
        }
        currencyTableView.reloadData()
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Avenir", size: 30)
            pickerLabel?.textAlignment = .center
        }
        pickerLabel?.text = pickerData[row]
        pickerLabel?.textColor = UIColor.black
        
        return pickerLabel!
    }
    
    
}


extension CurrencyVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCurrency.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as? currencyCell
        let indexCurrency = Array(myCurrencyDict.keys.sorted())[indexPath.row]
        let indexRates = trovaString(currency: indexCurrency)
       // let indexRates = Array(myCurrencyDict.values)[indexPath.row]
        cell?.setCurrncy(currency: indexCurrency, rates: indexRates, flag: indexCurrency)
        return cell!
    }
    
    func trovaString (currency : String) -> Double{
        var a : Double = 0.0
        
        for i in myCurrencyDict{
            if i.key == currency {
                a = i.value
            }
        }
        return a
    }
}
