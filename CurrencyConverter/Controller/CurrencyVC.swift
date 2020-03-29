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
    var myCurrencyName : [String] = []
    var myCurrencyRates : [Double] = []
    var myCurrencyDict : [String : Double] = [:]
    var importo : Double = 0.0
    
    
    @IBOutlet weak var valutaDaConvertitreTxt: UITextField!
    @IBOutlet weak var currencyBaseLbl: UILabel!
    @IBOutlet weak var currencyTableView: UITableView!
    
    @IBOutlet weak var dateAndTimeLbl: UILabel!
    @IBOutlet weak var convertiBtn: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        currencyTableView.dataSource = self
        currencyTableView.delegate = self
        currencyTableView.reloadData()
        //dateAndTimeLbl.text = "Currency Time: \(getDateAndTime())"

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        currencyTableView.delegate = self
        currencyTableView.dataSource = self
    }
    
    

    
    
    func getWeatherData(url: String, parameters: [String:String]){
        
        AF.request(url, method: .get, parameters:parameters).responseJSON{
            response in
            
            switch response.result{
            case .success(let value):
                print("Success! Got the weather data",value)
                let currencyJSON : JSON = JSON(arrayLiteral: value)
                print(currencyJSON)
                self.updateCurrency(json: currencyJSON)
            case .failure(let error):
                self.valutaDaConvertitreTxt.placeholder = "Connection Issue"
                print(error.localizedDescription)
            }
        }
    }
    
    
   
    
    func updateCurrency(json : JSON){

        
        myCurrencyDict = [:]
        myCurrencyName = []
        myCurrencyRates = []
        

        
        
        
        let ron = json["rates"]["RON"].doubleValue
        
        myCurrencyDict["RON"] = (ron * importo).twoDecimalNumbers(place: 3)
        
        
        let trys = json["rates"]["TRY"].doubleValue
        myCurrencyDict["TRY"] = (trys * importo).twoDecimalNumbers(place: 3)
        
        let zar = json["rates"]["ZAR"].doubleValue
        myCurrencyDict["ZAR"] = (zar * importo).twoDecimalNumbers(place: 3)
        
        let php = json["rates"]["PHP"].doubleValue
        myCurrencyDict["PHP"] = (php * importo).twoDecimalNumbers(place: 3)
        
        let myr = json["rates"]["MYR"].doubleValue
        myCurrencyDict["MYR"] = (myr * importo).twoDecimalNumbers(place: 3)
        
        let mxn = json["rates"]["MXN"].doubleValue
        myCurrencyDict["MXN"] = (mxn * importo).twoDecimalNumbers(place: 3)
        
        let hrk = json["rates"]["HRK"].doubleValue
        myCurrencyDict["HRK"] = (hrk * importo).twoDecimalNumbers(place: 3)
        
        let aud = json["rates"]["AUD"].doubleValue
        myCurrencyDict["AUD"] = (aud * importo).twoDecimalNumbers(place: 3)
        
        let thb = json["rates"]["THB"].doubleValue
        myCurrencyDict["THB"] = (thb * importo).twoDecimalNumbers(place: 3)
        
        let usd = json["rates"]["USD"].doubleValue
        myCurrencyDict["USD"] = (usd * importo).twoDecimalNumbers(place: 3)
        
        let idr = json["rates"]["IDR"].doubleValue
        myCurrencyDict["IDR"] = (idr * importo).twoDecimalNumbers(place: 3)
        
        let jpy = json["rates"]["JPY"].doubleValue
        myCurrencyDict["JPY"] = (jpy * importo).twoDecimalNumbers(place: 3)
        
        let huf = json["rates"]["HUF"].doubleValue
        myCurrencyDict["HUF"] = (huf * importo).twoDecimalNumbers(place: 3)
        
        let cny = json["rates"]["CNY"].doubleValue
        myCurrencyDict["CNY"] = (cny * importo).twoDecimalNumbers(place: 3)
        
        let dkk = json["rates"]["DKK"].doubleValue
        myCurrencyDict["DKK"] = (dkk * importo).twoDecimalNumbers(place: 3)
        
        let hkd = json["rates"]["HKD"].doubleValue
        myCurrencyDict["HKD"] = (hkd * importo).twoDecimalNumbers(place: 3)
        
        let inr = json["rates"]["INR"].doubleValue
        myCurrencyDict["INR"] = (inr * importo).twoDecimalNumbers(place: 3)
        
        let rub = json["rates"]["RUB"].doubleValue
        myCurrencyDict["RUB"] = (rub * importo).twoDecimalNumbers(place: 3)
        
        let bgn = json["rates"]["BGN"].doubleValue
        myCurrencyDict["BGN"] = (bgn * importo).twoDecimalNumbers(place: 3)
        
        let gbp = json["rates"]["GBP"].doubleValue
        myCurrencyDict["GBP"] = (gbp * importo).twoDecimalNumbers(place: 3)
        
        let pln = json["rates"]["PLN"].doubleValue
        myCurrencyDict["PLN"] = (pln * importo).twoDecimalNumbers(place: 3)
        
        let chf = json["rates"]["CHF"].doubleValue
        myCurrencyDict["CHF"] = (chf * importo).twoDecimalNumbers(place: 3)
        
        let nok = json["rates"]["NOK"].doubleValue
        myCurrencyDict["NOK"] = (nok * importo).twoDecimalNumbers(place: 3)
        
        let brl = json["rates"]["BRL"].doubleValue
        myCurrencyDict["BRL"] = (brl * importo).twoDecimalNumbers(place: 3)
        
        let ils = json["rates"]["ILS"].doubleValue
        myCurrencyDict["ILS"] = (ils * importo).twoDecimalNumbers(place: 3)
        
        let cad = json["rates"]["CAD"].doubleValue
        myCurrencyDict["CAD"] = (cad * importo).twoDecimalNumbers(place: 2)
        
        let sgd = json["rates"]["SGD"].doubleValue
        myCurrencyDict["SGD"] = (sgd * importo).twoDecimalNumbers(place: 3)
        
        let czk = json["rates"]["CZK"].doubleValue
        myCurrencyDict["CZK"] = (czk * importo).twoDecimalNumbers(place: 3)
        
        let isk = json["rates"]["ISK"].doubleValue
        myCurrencyDict["ISK"] = (isk * importo).twoDecimalNumbers(place: 3)
        
        let nzd = json["rates"]["NZD"].doubleValue
        myCurrencyDict["NZD"] = (nzd * importo).twoDecimalNumbers(place: 3)
        
        let krw = json["rates"]["KRW"].doubleValue
        myCurrencyDict["KRW"] = (krw * importo).twoDecimalNumbers(place: 3)
        
        let sek = json["rates"]["SEK"].doubleValue
        myCurrencyDict["SEK"] = (sek * importo).twoDecimalNumbers(place: 3)
        

        for i in myCurrencyDict{

            myCurrencyName.append(i.key)
            myCurrencyRates.append(i.value)
        }
        print("LA MIA LISTA NAME",myCurrencyName)
        print("LA MIA LISTA RATES", myCurrencyRates)
        currencyTableView.reloadData()

    }
    
    
    
    
    func tapGestureRecognize(){
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(rimuoviTastiera))
        view.addGestureRecognizer(tap)
        currencyTableView.reloadData()
    }
    
    @objc func rimuoviTastiera(){
        self.view.endEditing(true)
        currencyTableView.reloadData()
    }
    
    
    @IBAction func convertBtnWasPressed(_ sender: Any) {
        if valutaDaConvertitreTxt.text! == ""{
            //importo = 1
            alert()
            return
        } else {
            importo = Double(valutaDaConvertitreTxt.text!) as! Double
           // let amount: Double = 123.45
            
            let amountString = String(format: "%.02f €", importo)
            valutaDaConvertitreTxt.text = amountString
        }
        print("IMPORTO", importo)
        let params : [String : String] = ["base" : "EUR"]
        getWeatherData(url: MY_URL, parameters: params)
        self.view.endEditing(true)
        dateAndTimeLbl.text = "Currency Time: \(getDateAndTime())"
        convertiBtn.isHidden = true
        currencyTableView.reloadData()
    }
    
    
    @IBAction func touchUPInside(_ sender: Any) {
        
    }
    @IBAction func textChanged(_ sender: Any) {
        convertiBtn.isHidden = false
    }
    
    @IBAction func cancelText(_ sender: Any) {
        valutaDaConvertitreTxt.text = ""
    }
    
    
    func alert (){
        let alert = UIAlertController(title: "ATTENTION !!!", message: "Please enter the amount to convert", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (UIAlertAction) in
            print("User click Approve button")
        }))
        
        self.present(alert,animated: true, completion: {
            print("completion block")
        })
    }
    
    
    
    func getDateAndTime () -> String{
        
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let myString = formatter.string(from: Date()) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd-MMM-yyyy HH:mm:ss"
        // again convert your date to string
        let myStringafd = formatter.string(from: yourDate!)
        return myStringafd
    }
    

    
    
}




//MARK: - Extension UITableViewDelegte UITableViewDataSource
extension CurrencyVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCurrencyName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as? currencyCell
        //let indexCurrency = Array(myCurrencyDict.keys.sorted())[indexPath.row]
        let indexCurrency = myCurrencyName[indexPath.row]
        print("MY INDEX", indexCurrency)
        //let indexRates = trovaString(currency: indexCurrency)
        let indexRates = myCurrencyRates[indexPath.row]
        //let indexName = currencyName(currency: indexCurrency)
        //let cello = raggruppamento(nome: myCurrencyName, rates: myCurrencyRates, flag: valuta, indexPath: indexPath.row)
            // cell?.setCurrncy(currency: indexCurrency, rates: indexRates, flag:indexCurrency, name: indexName)
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

//extension Double {
//    func twoDecimalNumbers(place: Int) -> Double{
//        let divisor = pow(10.0, Double(place))
//        return (self * divisor).rounded() / divisor
//    }
//}
