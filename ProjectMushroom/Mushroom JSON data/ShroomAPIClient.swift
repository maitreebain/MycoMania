//
//  ShroomAPIClient.swift
//  ProjectMushroom
//
//  Created by Maitree Bain on 12/6/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import Foundation

struct ShroomsAPIClient {
    
    static func fetchData(completion: @escaping (Result<[MushroomDataLoad], AppError>) -> ()) {
        let endPointString = "https://raw.githubusercontent.com/MyShroom/myshroom-api/master/public/mushrooms.json"
        
        guard let url = URL(string: endPointString) else {
            completion(.failure(.badURL(endPointString)))
            return
        }
        
        let request = URLRequest(url: url)
    
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            
            switch result{
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                dump(data)
                do {
                    let mushroomData = try JSONDecoder().decode([MushroomDataLoad].self, from: data)
                    
                    completion(.success(mushroomData))
                }
                catch {
                    completion(.failure(.decodingError(error)))
                }
                
                
            }
        }
}
}
