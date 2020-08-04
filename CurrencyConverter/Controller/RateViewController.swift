//
//  RateViewController.swift
//  CurrencyConverter
//
//  Created by Massimiliano on 28/03/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import UIKit
//import Firebase

class RateViewController: UIViewController {
    
    
    //MARK: - My IBOutlet
    
    @IBOutlet weak var currencyPickerView: UIPickerView!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var amountToConvertText: UITextField!
    @IBOutlet weak var dismissKeyboardBtn: UIButton!
    
    
    //MARK: - My Variables
    public var currencyName: String = ""
    public var currency = CurrencyModelClass()
    public var amount: String?
    var currencyManager = CurrencyManager()
    var newCurrency: CurrencyClass?
    
    //MARK: - ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 13.0, *) {
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }
        

        MyAnalytics.myAnalytics(forEvent: "ViewDidLoad RateViewCotroller", forViewController: self, forText: "Accesso alla prima schermata")
        
        currencyPickerView.delegate = self
        currencyPickerView.dataSource = self
        currencyPickerView.alpha = 0
        dismissKeyboardBtn.isHidden = true
    }
    
    
    
    //MARK: - ViewDidAppear()
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tapGestureRecognize()
    }
    
    
    //MARK: - ViewWillAppear()
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        convertButton.alpha = 0
        currencyPickerView.alpha = 0
        dismissKeyboardBtn.isHidden = true
        amountToConvertText.text = ""
        currencyPickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    
    //MARK: - IBActions
    
    
    
    //MARK: - ConvertButtonWasPressed
    @IBAction func convertButtonWasPressed(_ sender: UIButton) {
        amount = amountToConvertText.text!
        currencyManager.getCurrency(currency: currencyName, ammount: amount!) {
            self.newCurrency = $0
            
            MyAnalytics.myAnalytics(forEvent: "ConvertButtonWasPressed", forViewController: self, forText: "Customer has pressed convert button")
            MyAnalytics.myAnalytics(forEvent: "Customer choose", forViewController: self, forText: "Customer check \(self.currencyName)")
            
            self.performSegue(withIdentifier: "segueToMain", sender: self.newCurrency)
        }
    }
    
    
    //MARK: - PrepareForSegue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToMain"{
            let vc = segue.destination as! CurrencyViewController
            vc.newCurrency = sender as? CurrencyClass
        } else {
            print("No segue")
        }
    }
    
    
    
    //MARK: - AmountTextEditingChanged
    @IBAction func amountTextEditingChanged(_ sender: UITextField) {
        if amountToConvertText.text == ""{
            convertButton.alpha = 0
            currencyPickerView.alpha = 0
            dismissKeyboardBtn.isHidden = true
        } else if amountToConvertText.text != "" {
            convertButton.alpha = 0
            currencyPickerView.selectRow(0, inComponent: 0, animated: true)
            currencyPickerView.alpha = 1
            dismissKeyboardBtn.isHidden = false
        }
    }
    
    
    
    //MARK: - AmountTextValueChanged
    @IBAction func amountTextValueChanged(_ sender: UITextField) {
        print(#function)
    }
    
    //MARK: - DismissKeyboardButton
    @IBAction func dismissKeyboardButton(_ sender: UIButton) {
        self.amountToConvertText.endEditing(true)
        self.dismissKeyboardBtn.isHidden = true
    }
    
    //MARK: - TextFieldTouchDown
    @IBAction func textFieldTouchDown(_ sender: UITextField) {
        dismissKeyboardBtn.isHidden = false
        currencyPickerView.alpha = 0
    }
    
    
    
    //MARK: - Tap Gesture Recognize
    func tapGestureRecognize(){
        let tap : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(rimuoviTastiera))
        view.addGestureRecognizer(tap)
    }
    
    @objc func rimuoviTastiera(){
        self.view.endEditing(true)
        self.amountToConvertText.endEditing(true)
        self.dismissKeyboardBtn.isHidden = true
    }
 
}


//MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension RateViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        currencyManager.currencies.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        currencyManager.currencies[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "Avenir", size: 30)
            pickerLabel?.textAlignment = .center
        }
        
        pickerLabel?.text = currencyManager.currencies[row]
        pickerLabel?.textColor = UIColor.white
        
        return pickerLabel!
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        currencyName = currencyManager.currency.currencyName(currencyManager.currencies[row])
        self.tapGestureRecognize()
        
        DispatchQueue.main.async {
            if self.currencyName != "UNKNOW" && self.amountToConvertText.text != ""{
                self.convertButton.isHidden = false
                self.convertButton.alpha = 1
            } else{
                self.convertButton.isHidden = true
                self.convertButton.alpha = 0
            }
        }
    }
    
    
    
}



