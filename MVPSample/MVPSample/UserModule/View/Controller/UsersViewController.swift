//
//  UsersViewController.swift
//  MVPSample
//
//  Created by lucas.henrique.costa on 10/05/21.
//

import UIKit

class UsersViewController: UIViewController {
    
    private let presenter: UserPresentable
    private let dataSource: UsersDataSource
    private let userView: UsersView
    
    init(presenter: UserPresentable, dataSource: UsersDataSource) {
        self.presenter = presenter
        self.dataSource = dataSource
        self.userView = UsersView()
        super.init(nibName: nil, bundle: nil)
        userView.setupDataSource(dataSource)
    }
    
    override func loadView() {
        super.loadView()
        view = userView
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadUsers()
    }

}

extension UsersViewController: UserPresenterDelegate {
    func presentUsers(users: [User.ViewModel]) {
        DispatchQueue.main.async {
            self.dataSource.setup(users)
            self.userView.reloadData()
        }
    }
}
