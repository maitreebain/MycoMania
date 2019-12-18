//
//  ShroomImagesAPIClient.swift
//  ProjectMushroom
//
//  Created by Maitree Bain on 12/18/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

struct ShroomImagesAPIClient {
    
    static func fetchImage(for imageName: String, completion: @escaping (Result<[Images], AppError>) -> ()) {
        
        let endpointString = "https://pixabay.com/api/?key=\(SecretKey.appKey)&q=\(imageName)&image_type=photo&pretty=true"
        
        guard let url = URL(string: endpointString) else {
            completion(.failure(.badURL(endpointString)))
            return
        }
        
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                
                do {
                    let imagesData = try JSONDecoder().decode(ImageDataLoad.self, from: data)
                    
                    let image = imagesData.hits
                    
                    completion(.success(image))
                }
                catch{
                    completion(.failure(.decodingError(error)))
                }
            }
            
        }
    }
    
}
