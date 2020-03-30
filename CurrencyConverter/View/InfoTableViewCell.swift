//
//  InfoTableViewCell.swift
//  CurrencyConverter
//
//  Created by Massimiliano on 30/03/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageApp: UIImageView!
    @IBOutlet weak var nameAppLabel: UILabel!
    
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        print(#function)
//        //self.layoutIfNeeded()
//        self.imageApp.layoutIfNeeded()
//        self.imageApp.layer.cornerRadius = self.frame.height / 2.0
//        self.imageApp.layer.masksToBounds = true
//        //self.imageApp.clipsToBounds = true
//        self.nameAppLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//    }
    


    
    func setupCell(forImage image: String,forName name: String){
        imageView?.image = UIImage(named: image)
        nameAppLabel.text = name
    }

}
