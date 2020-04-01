//
//  NetworkRequestAgent.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 1/7/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import Foundation
import Combine

struct NetworkRequestAgent {
    
    func run<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, NetworkError> {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try decoder.decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .mapError { error in
                .network(description: error.localizedDescription)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

extension NetworkRequestAgent {
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
}
