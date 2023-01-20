//
//  AstroService.swift
//  DailyAstrology
//
//  Created by Meghan Sun on 1/19/23.
//

import Foundation

enum APIError: String, Error {
    case invalidUrl = "Invalid URL."
    case failedRequest = "The network request failed."
    case decodingError = "This was an issue while decoding data"
}

class AstroService {
    
    func postRequest(sign: String, day: String, completion: @escaping (Result<Horoscope, APIError>) -> Void) {
        
        // start with base url component
        guard var baseURL = URLComponents(string: "https://aztro.sameerkumar.website") else {
            completion(.failure(.invalidUrl))
            return
        }
        
        // Parameters to query (https://aztro.sameerkumar.website?sign=<sign_param>s&day=<day_param>)
        baseURL.queryItems = [
            URLQueryItem(name: "sign", value: sign),
            URLQueryItem(name: "day", value: day)
        ]

        guard let requestURL = baseURL.url else {
            completion(.failure(.invalidUrl))
            return
        }
        
//      print(baseURL)
        
        var request = URLRequest(url: requestURL)
        
        // Request Details
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
      
        // Process the Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check for valid data, no error, and an ok status
            guard let data = data, error == nil, let httpResponse = response as? HTTPURLResponse,
                     (200...299).contains(httpResponse.statusCode) else {
                completion(.failure(.failedRequest))
                return
            }
  
            // Now decode our response json into our Horoscope struct
            do {
                let response = try JSONDecoder().decode( Horoscope.self, from: data)
                print("Success \(response)")
                completion(.success(response))
                
            } catch {
                print(error)
                completion(.failure(.decodingError))
            }
        }
        
        // resumes task, if it is suspended
        task.resume()
    }

}
