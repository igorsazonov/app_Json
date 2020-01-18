//
//  ViewController.swift
//  app_Json
//
//  Created by Игорь Сазонов on 11/12/2019.
//  Copyright © 2019 Игорь Сазонов. All rights reserved.
//

import UIKit
import RealmSwift
//import Realm
class CountryViewController: UITableViewController {

    var countryViewModel = CountryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryViewModel.jsonLoad()
        navigationItem.title = "title" .localized   
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //let realm : Realm = try! Realm()
       
        let countryRealm = CountryRealm()
        
        let objectsRealmList = List<CountryRealm>()
        
        for country in countryViewModel.massCountry {
            countryRealm.countryName = country.countryName
            print(countryRealm.countryName)
            objectsRealmList.append(countryRealm)
        }
        
        let realm =  try? Realm()
        
        do {
            try! realm?.write {
                realm?.add(objectsRealmList)
            }
        } catch {
            print(error.localizedDescription)
        }
        
        print(Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryViewModel.massCountry.count
        //return listCountry.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCountry = countryViewModel.massCountry[indexPath.row]
        let customView = tableView.registerNib(CountryTableViewCell.self)
        customView.backgroundColor = .yellow
        customView.label.text = currentCountry.countryName
        return customView
        
        /*let currentCountry = listCountry[indexPath.row]
        let customView = tableView.registerNib(CountryTableViewCell.self)
        customView.backgroundColor = .yellow
        customView.label.text = currentCountry.countryName
        return customView*/
        
    }
}

