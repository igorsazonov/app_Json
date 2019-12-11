//
//  CountryViewModel.swift
//  app_Json
//
//  Created by Игорь Сазонов on 11/12/2019.
//  Copyright © 2019 Игорь Сазонов. All rights reserved.
//

import Foundation

class CountryViewModel {
    
    //Data Model of the ViewModel
    var country = [Country]()
    
    func jsonLoad() {
        let jsonArray = parseJson()
        print(jsonArray)
        country = jsonArray.compactMap{return Country($0)}
    }
    
    func parseJson() -> [[String: Any]] {
        var arrayJson = [[:]]
        let url = Bundle.main.url(forResource: "messages", withExtension: "json")
        guard let newUrl = url else {
            print("json not found")
            return [[:]]
        }
        guard let data = try? Data(contentsOf: newUrl) else {
            print("data not found")
            return [[:]]
        }
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
            print("failed json")
            return [[:]]
        }
        if let newJson = json as? [String: Any] {
            guard let jsonArray = newJson["country"] as? [[String: Any]] else {
                return [[:]]
            }
            arrayJson = jsonArray
        }
        return arrayJson as! [[String : Any]]
    }
}

