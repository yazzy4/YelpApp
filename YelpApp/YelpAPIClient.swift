//
//  YelpAPIClient.swift
//  YelpApp
//
//  Created by Yaz Burrell on 8/5/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badStatusCode
    case apiError(Error)
    case jsonDecodingError(Error)
}

class YelpAPIClient {
    public func searchBusinesses(completion: @escaping ([Business], NetworkError?) -> Void) {
        let endPointURL = "https://api.yelp.com/v3/businesses/search?term=coffee&location=10023"
        guard let url = URL(string: endPointURL) else {
            completion([], NetworkError.badURL)
            return
        }
        var request = URLRequest(url: url)
        let accessToken = SecretKeys.YelpAPIKey
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion([], NetworkError.apiError(error))
            } else if let data = data {
                do {
                    let searchResult = try JSONDecoder().decode(BusinessSearch.self, from: data)
                    completion(searchResult.business, nil)
                } catch {
                    completion([], NetworkError.jsonDecodingError(error))
                }
            }
        }
        task.resume()
    }
}
