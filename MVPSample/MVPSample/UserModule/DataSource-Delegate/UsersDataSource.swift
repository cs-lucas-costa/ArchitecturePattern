//
//  UsersDataSource.swift
//  MVPSample
//
//  Created by lucas.henrique.costa on 10/05/21.
//

import Foundation
import UIKit

final class UsersDataSource:NSObject, UITableViewDataSource {
    
    private var usersViewModel: [User.ViewModel] = []
    
    func setup(_ usersViewModel: [User.ViewModel]) {
        self.usersViewModel = usersViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let user = usersViewModel[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCell.identifier,
                                                 for: indexPath) as! UserTableViewCell
        cell.name.text = user.name
        cell.username.text = user.username
        cell.email.text = user.email
        return cell
    }
    
}
