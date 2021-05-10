//
//  NetworkManager.swift
//  MVPSample
//
//  Created by lucas.henrique.costa on 10/05/21.
//

import Foundation
import Combine

protocol Service {
    func get<Object: Decodable>(from url: URL,
                                type: Object.Type) -> AnyPublisher<Object, Error>
}

final class NetworkManager: Service {
    
    func get<Object: Decodable>(from url: URL,
                                type: Object.Type) -> AnyPublisher<Object, Error> {
        
        URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: type, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
    }
    
}

