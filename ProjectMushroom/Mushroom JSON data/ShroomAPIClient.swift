//
//  ShroomAPIClient.swift
//  ProjectMushroom
//
//  Created by Maitree Bain on 12/6/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct ShroomsAPIClient: Error {
    
    enum NetworkError: Error {
        case badURL(String)
        case networkClientError(Error)
        case noResponse
        case badStatus(Int)
        case noData
        case decodingError(Error)
    }
    
    static func fetchData(completion: @escaping (Result<[MushroomDataLoad], NetworkError>) -> ()) {
        let endPointString = "https://raw.githubusercontent.com/MyShroom/myshroom-api/master/public/mushrooms.json"
        
        guard let url = URL(string: endPointString) else {
            completion(.failure(.badURL(endPointString)))
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            //check for errors
            if let error = error {// if error is nil there was no network error
                completion(.failure(.networkClientError(error)))
            }
            
            guard let urlResponse = response as? HTTPURLResponse else {
                completion(.failure(.noResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            switch urlResponse.statusCode {
            case 200...299:
                break
            default:
                completion(.failure(.badStatus(urlResponse.statusCode)))
            }
            
            //use data to create Joke Model
            
            do {
                let mushroom = try JSONDecoder().decode([MushroomDataLoad].self, from: data)
                
                completion(.success(mushroom))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }
        dataTask.resume()
    }
    
}
