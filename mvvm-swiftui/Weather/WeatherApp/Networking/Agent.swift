//
//  Agent.swift
//  WeatherApp
//
//  Created by Alex Hu on 2022/7/15.
//

import Combine
import Foundation

// Similiar with provider?
struct Agent {
    
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    
    func fetch<T: Decodable>(_ request: URLRequest, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<Response<T>, Error>  {
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                let value = try decoder.decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
