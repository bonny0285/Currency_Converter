//
//  InfoViewController.swift
//  CurrencyConverter
//
//  Created by Massimiliano on 30/03/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var infoVersionAppLabel: UILabel!
    @IBOutlet weak var tabelView: UITableView!
    
    
    let imageArray: [String] = ["GazzettinoNew","RunningApp","SmartForecast"]
    let nomeAppArray: [String] = ["Gazzettino News","Meet Run","Smart Forecast"]
    
    
    public var appVersion: String {
        get{
            return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        infoVersionAppLabel.text = "App Version: \(appVersion)"
        tabelView.delegate = self
        tabelView.dataSource = self
    }
    


    
    
    @IBAction func backButtonWasPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func openAppStore(fornumber number: Int){
        let urlArray: [String] = ["https://apps.apple.com/gb/app/gazzettino-news/id1502599780","https://apps.apple.com/gb/app/meet-run/id1490627946","https://apps.apple.com/gb/app/smart-forecast/id1465603929"]
        
        if let url = URL(string: urlArray[number]), UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:]) { (opened) in
                if opened{
                    print("App Store Opened")
                } else {
                    print("Can't Open App Store")
                }
            }
        }
    }
    
    
    
    
    func roundImage(forImage image: UIImageView){
        image.layoutIfNeeded()
        image.layer.cornerRadius = image.frame.height / 2
        image.layer.masksToBounds = true
        image.clipsToBounds = true
    }
    
    
}



//MARK: - Extension InfoViewController: UITableViewDelegate, UITableViewDataSource
extension InfoViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! InfoTableViewCell
        
        roundImage(forImage: cell.imageApp)
        cell.setupCell(forImage: imageArray[indexPath.row], forName: nomeAppArray[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        openAppStore(fornumber: indexPath.row)
    }
    
}
