//
//  ShroomImagesAPIClient.swift
//  ProjectMushroom
//
//  Created by Maitree Bain on 12/18/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

struct ShroomImagesAPIClient {
    
    static func fetchImage(for imageName: String, completion: @escaping (Result<UIImage, AppError>) -> ()) {
        
        let endpointString = "https://pixabay.com/api/?key=0&q=roses&image_type=photo&pretty=true"
        
        guard let url = URL(string: endpointString) else {
            completion(.failure(.badURL(endpointString)))
            return
        }
        
        
        //"https://pixabay.com/images/search/field%20mushroom/"
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                
                do {
//                    let images = JSONDecoder().decode(.self, from: data)
                    
                }
                catch{
                    
                }
            }
            
        }
    }
    
}
