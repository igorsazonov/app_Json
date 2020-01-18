//
//  CountryViewModel.swift
//  app_Json
//
//  Created by Игорь Сазонов on 11/12/2019.
//  Copyright © 2019 Игорь Сазонов. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class CountryViewModel {
    
    //Data Model of the ViewModel
    var massCountry = [Country]()
    
    func jsonLoad() {
        let jsonArray = parseJson()
        print(jsonArray)
        massCountry = jsonArray.compactMap{return Country($0)}
        /*let realm = try! Realm()
        for country in massCountry {
            let countryRealm = CountryRealm()
            countryRealm.countryName = country.countryName
            try! realm.write({
                realm.add(countryRealm)
            })
        }*/
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
