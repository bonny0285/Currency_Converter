//
//  NewCurrencyTableViewCell.swift
//  CurrencyConverter
//
//  Created by Massimiliano on 29/03/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import UIKit

class NewCurrencyTableViewCell: UITableViewCell {

    
//MARK: - My IBOutlet
    @IBOutlet weak var imageCurrencyFlag: UIImageView!
    @IBOutlet weak var currencyNameLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }


    
//MARK: - SetupCell()
    func setupCell(forImageFlag flag: String,forRate rate: String, forCurrencyName currency: String,forCurrency currencyDouble: Double){
        imageCurrencyFlag.image = UIImage.init(named: flag)
        currencyNameLabel.text = "\(currency)"
        currencyLabel.text = "\(currencyDouble) - \(rate)"
    }
    

}
