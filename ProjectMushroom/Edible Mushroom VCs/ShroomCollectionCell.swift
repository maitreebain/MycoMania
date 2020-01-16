//
//  ShroomCollectionCell.swift
//  ProjectMushroom
//
//  Created by Maitree Bain on 1/16/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit

class ShroomCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var mushroomTNImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var latinNameLabel: UILabel!
    
    var shroomImage: Image?
    
    func configureCell(for mushroom: MushroomDataLoad, chosenMushroom: String) {
            
            nameLabel.text = mushroom.common.last?.description
            latinNameLabel.text = mushroom.latin
        
        ShroomImagesAPIClient.fetchImage(for: chosenMushroom) { [weak self] (result) in

            switch result {
            case .failure(let appError):
                print("no image displayed: \(appError)")
            case .success(let image):
                self?.shroomImage = image
                guard let imageURL = self?.shroomImage?.largeImageURL else {
                    print("large url not found")
                    return
                }

                DispatchQueue.main.async {
                    self?.mushroomTNImage.getImage(for: imageURL) { [weak self] (result) in
                        switch result {
                        case .failure(let error):
                            print("\(error)")
                        case .success(let image):
                            DispatchQueue.main.async {
                                self?.mushroomTNImage.image = image

                            }
                        }
                    }
                }
            }

        }
        
        
    }
}

