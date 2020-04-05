//
//  APIRouter.swift
//  WeatherMether
//
//  Created by amirhosseinpy on 1/7/1399 AP.
//  Copyright © 1399 Sepitmaan. All rights reserved.
//

import Foundation

enum APIRouter {
    case getWeather
    
    private static let baseURLString = ""
    
    private enum HTTPMethod {
        case get
        case post
        case put
        case delete
        
        var value: String {
            switch self {
            case .get: return "GET"
            case .post: return "POST"
            case .put: return "PUT"
            case .delete: return "DELETE"
            }
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getWeather:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getWeather:
            return "https://weather-meather-weather-meather.fandogh.cloud/weather?cityId=112931"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        default:
            return nil
        }
    }
    
    func request() throws -> URLRequest {
        let encodedPath = path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "\(APIRouter.baseURLString)\(encodedPath)"
        
        guard let url = URL(string: urlString) else {
            throw NetworkError.parsing(description: "URL parsing failed!")
        }
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
        request.httpMethod = method.value
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let parameters = parameters {
            if method == .post {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
                    
                    request.httpBody = jsonData
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
        return request
    }
    
//    func request()  -> AnyPublisher<URLRequest,NetworkError> {
//           return Future<URLRequest,NetworkError> { result in
//               let encodedPath = self.path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
//               let urlString = "\(APIRouter.baseURLString)\(encodedPath)"
//               
//               guard let url = URL(string: urlString) else {
//                   return result(.failure(NetworkError.parsing(description: "URL parsing failed!")))
//               }
//               
//               var request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData, timeoutInterval: 10)
//               request.httpMethod = self.method.value
//               request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//               
//               if let parameters = self.parameters {
//                   if self.method == .post {
//                       do {
//                           let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//                           
//                           request.httpBody = jsonData
//                       } catch {
//                           print(error.localizedDescription)
//                       }
//                   }
//               }
//               
//               return result(.success(request))
//           }.eraseToAnyPublisher()
//       }
}

public typealias Parameters = [String: Any]
