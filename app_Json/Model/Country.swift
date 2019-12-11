//
//  Country.swift
//  app_Json
//
//  Created by Игорь Сазонов on 11/12/2019.
//  Copyright © 2019 Игорь Сазонов. All rights reserved.
//

import Foundation

class Country {
    let countryName: String
    
    init(_ dictionary: [String: Any]) {
        self.countryName = dictionary["Name"] as? String ?? "NA"
    }
}
