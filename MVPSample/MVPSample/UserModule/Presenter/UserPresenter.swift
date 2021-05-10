//
//  UserPresenter.swift
//  MVPSample
//
//  Created by lucas.henrique.costa on 10/05/21.
//

import Foundation
import Combine

protocol UserPresenterDelegate: AnyObject {
    func presentUsers(users: [User.ViewModel])
}

protocol UserPresentable {
    func loadUsers()
}

final class UserPresenter: UserPresentable {
    
    weak var delegate: UserPresenterDelegate?
    private let service: Service
    private var cancellables: [AnyCancellable] = []
    private var users: [User.ViewModel] = [] {
        didSet {
            delegate?.presentUsers(users: users)
        }
    }
    
    init(service: Service) {
        self.service = service
    }
    
    func loadUsers() {
        service.get(from: URL(string: "https://jsonplaceholder.typicode.com/users")!,
                    type: [User].self)
            .sink(receiveCompletion: { print($0) },
                  receiveValue: { [weak self] in
                    self?.users = $0.map { user in User.ViewModel(user: user) }
                  })
            .store(in: &cancellables)
        
    }
}
