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
    private static func run<T: Decodable>(_ router: APIRouter, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, NetworkError> {
        do {
            return try URLSession.shared
                .dataTaskPublisher(for: router.request())
                .tryMap { result -> Response<T> in
                    let value = try decoder.decode(T.self, from: result.data)
                    return Response(value: value, response: result.response)
            }
            .mapError { error in
                .network(description: error.localizedDescription)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        } catch let error {
            return Fail(error: error).mapError { error in
                (error as? NetworkError ?? .parsing(description: error.localizedDescription))
            }.eraseToAnyPublisher()
        }
    }
    
    static func run<T: Decodable>(_ router: APIRouter, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, NetworkError> {
        return self.run(router)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}

extension NetworkRequestAgent {
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
}
