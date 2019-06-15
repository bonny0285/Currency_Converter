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
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currencyBaseLbl: UILabel!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.delegate = self
        currencyPicker.dataSource = self
        //startJSON()
        // Do any additional setup after loading the view.
    }


    
    
    func startJSON (){
        let params : [String : String] = ["base" : valuta]
        getWeatherData(url: MY_URL, parameters: params)
    }
    
    
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
        var base = json["base"].stringValue
        currencyBaseLbl.text = "Currency base : \(base)"
        var date = json["date"].stringValue
        var eur = json["rates"]["EUR"].doubleValue
        print(base)
        print(date)
        print(eur)
//        var articles = json["articles"].count
//        for i in 0...19 {
//            var image = json["articles"][i]["urlToImage"].stringValue
//            var title = json["articles"][i]["title"].stringValue
//            var url = json["articles"][i]["url"].stringValue
//            arrayTitle.append(title)
//            arrayImage.append(image)
//            arrayURL.append(url)
//        }
//        var author = json["articles"][0]["author"].stringValue
//
//
//        var descriptions = json["articles"][0]["descriprion"].stringValue
//
//        //var articles = json["articles"].count
//        print("ARTICOLI",articles)
//
//        print(arrayTitle)
//        print(news.author)
//        print(news.title)
//        print(news.descriptions)
//        print(news.urlToImage)
//        print(news.articles)
//        self.newsCollection.reloadData()
//
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
        valuta = pickerData[row]
        let params : [String : String] = ["base" : valuta]
        getWeatherData(url: MY_URL, parameters: params)
//        letteraRegione = getStateID(nomeCitta: testLbl.text!)
//        cityLbl.text = letteraRegione
//        
//        
//        testLbl.text = pickerData[row]
//        nomeRegione = pickerData[row]
//        ricercaBtn.isHidden = false
//        print("SCELTA",getStateID(nomeCitta: testLbl.text!))
//        print("SCELTA VAR", letteraRegione)
//        
//        if getStateID(nomeCitta: testLbl.text!) == "Unknow" || getStateID(nomeCitta: testLbl.text!) == ""{
//            ricercaBtn.isHidden = true
//        } else {
//            ricercaBtn.isHidden = false
//        }
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
