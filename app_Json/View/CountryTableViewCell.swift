//
//  CountryTableViewCell.swift
//  app_Json
//
//  Created by Игорь Сазонов on 11/12/2019.
//  Copyright © 2019 Игорь Сазонов. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    var country: Country? {
        didSet{
            self.label.text = self.country?.countryName
        }
    }
    
    @IBOutlet weak var label: UILabel!
}
