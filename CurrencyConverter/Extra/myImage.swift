//
//  myImage.swift
//  CurrencyConverter
//
//  Created by Massimiliano on 30/03/2020.
//  Copyright © 2020 Massimiliano Bonafede. All rights reserved.
//

import UIKit

 class myImage: UIImageView {

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

     override func awakeFromNib() {
        print(#function)
        super.awakeFromNib()
        //self.layoutIfNeeded()
        layer.cornerRadius = self.frame.height / 2.0
        layer.masksToBounds = true
        clipsToBounds = true
        //self.layer.masksToBounds = true
    }
    
    


}
