//
//  ViewController.swift
//  app_Json
//
//  Created by Игорь Сазонов on 11/12/2019.
//  Copyright © 2019 Игорь Сазонов. All rights reserved.
//

import UIKit

class CountryViewController: UITableViewController {

    var countryViewModel = CountryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryViewModel.jsonLoad()
        navigationItem.title = NSLocalizedString("title", comment: "")
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryViewModel.country.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCountry = countryViewModel.country[indexPath.row]
        let customView = tableView.registerNib(CountryTableViewCell.self)
        customView.backgroundColor = .yellow
        customView.label.text = currentCountry.countryName
        return customView
    }
}

