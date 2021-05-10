//
//  UserTableViewCell.swift
//  MVPSample
//
//  Created by lucas.henrique.costa on 10/05/21.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    
    
}

extension UITableViewCell {
    static var identifier: String { String(describing: self) }
}
