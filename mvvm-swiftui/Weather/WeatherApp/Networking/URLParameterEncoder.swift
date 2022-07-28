//
//  URLParameterEncoder.swift
//  WeatherApp
//
//  Created by Alex Hu on 2022/7/25.
//

import Foundation

public struct URLParameterEncoder: ParameterEncoder {
    
    static func encode(urlRequest: inout URLRequest, with parameters: Parameters) throws {
        guard let url = urlRequest.url else { throw NetworkError.missingURL }
        if var urlComponents = URLComponents(url: url,
                                             resolvingAgainstBaseURL: false),
           !(parameters.isEmpty) {
            urlComponents.queryItems = [URLQueryItem]()
            
            parameters.forEach { (key, value) in
                let valueString = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
                let queryItem = URLQueryItem(name: key,
                                             value: valueString)
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
        
        if urlRequest.value(forHTTPHeaderField: "Content-Type") == nil {
            urlRequest.setValue("application/x-www-form-urlencoded; charset=utf-8",
                                forHTTPHeaderField: "Content-Type")
        }
    }
}
