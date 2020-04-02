//
//  CurrencyViewController.swift
//  CurrencyConverter
//
//  Created by Massimiliano on 29/03/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {
    
    
    //MARK: - My IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var currencyTimeLabel: UILabel!
    @IBOutlet weak var currencyName: UILabel!
    
    
    //MARK: - My Variables
    var currencyArray = CurrencyModelClass()
    var arrayRate = [String]()
    var arrayCurrency = [Double]()
    
    
    //MARK: - ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }
        
        currencyName.text = "From: \(currencyArray.base!)"
        currencyTimeLabel.isHidden = false
        currencyTimeLabel.text = "Currency Time: \(getDateAndTime())"
        
        if  currencyArray.currency?.count == 0{
            tableView.tableFooterView = UIView()
        }
        
        MyAnalytics.myAnalytics(forEvent: "ViewDidLoad CurrencyViewController", forViewController: self, forText: "Customer check the currency table view")
        
        MyAnalytics.myAnalytics(forEvent: "User Base", forViewController: self, forText: "Customer currency is: \(currencyArray.base!)")
        
        preparaPerDisplayCell(forCurrency: currencyArray)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        MyAnalytics.myAnalytics(forEvent: "ViewWillAppear CurrencyViewController", forViewController: self, forText: "Customer check again the currency table view")
    }
    
    
    //MARK: - GetDateAndTime()
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
    
    
    //MARK: - Back Button Was Pressed
    @IBAction func backButtonWasPressed(_ sender: UIButton) {
        MyAnalytics.myAnalytics(forEvent: "Back Button Was Pressed", forViewController: self, forText: "Customer has pressed the back button")
        dismiss(animated: true, completion: nil)
    }
    
    
    

    
}


//MARK: - Extension UITableVIewDelegate UITableViewDataSource
extension CurrencyViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyArray.currency!.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "currencyCell", for: indexPath) as! NewCurrencyTableViewCell
        
        cell.setupCell(forImageFlag: arrayRate[indexPath.row], forRate: arrayRate[indexPath.row], forCurrencyName: CurrencyModel.currencyGetNameCurrency(currency: arrayRate[indexPath.row]), forCurrency: arrayCurrency[indexPath.row])
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    //MARK: - PreparePerDsiplayCell
    func preparaPerDisplayCell(forCurrency currency: CurrencyModelClass){
        
        for i in currency.currency!{
            arrayRate.append(i.key)
            arrayCurrency.append(i.value)
        }
    }
    
    
}
