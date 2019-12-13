//
//  extensionUITableViewCell.swift
//  app_Json
//
//  Created by Игорь Сазонов on 11/12/2019.
//  Copyright © 2019 Игорь Сазонов. All rights reserved.
//

import UIKit

extension UITableView {
    func registerNib <T: UITableViewCell> (_: T.Type) -> T {
        return UINib(nibName: String(describing: T.self), bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! T
    }
}
