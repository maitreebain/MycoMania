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
    
    var defaultMushroom = "https://vignette.wikia.nocookie.net/nintendo/images/5/5b/Mushroom1.jpg/revision/latest?cb=20111104224030&path-prefix=en"
    
    func configureCell(for mushroom: MushroomDataLoad, chosenMushroom: String) {
        
        if  mushroom.attributes.deadly == false && mushroom.attributes.poisonous == false && mushroom.attributes.psychoactive == false{
            
            nameLabel.text = mushroom.common.last?.description
            latinNameLabel.text = mushroom.latin
        }
        
        ShroomImagesAPIClient.fetchImage(for: chosenMushroom) { [weak self] (result) in
            
            switch result {
            case .failure(let appError):
                print("no image displayed: \(appError)")
                DispatchQueue.main.async {
                    self?.mushroomTNImage.getImage(for: self!.defaultMushroom) { [weak self] (result) in
                        
                        switch result{
                        case .failure(let appError):
                            print("default pic not shown: \(appError)")
                            DispatchQueue.main.async {
                                self?.mushroomTNImage.image = UIImage(systemName: "star.fill")
                            }
                        case .success(let defaultImage):
                            DispatchQueue.main.async {
                                self?.mushroomTNImage.image = defaultImage
                            }
                            
                        }
                    }
                }
            case .success(let image):
                self?.shroomImage = image
                
                guard let imageURL = self?.shroomImage?.largeImageURL else {
                    DispatchQueue.main.async {
                        self?.mushroomTNImage.image = UIImage(systemName: "o.circle")
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    self?.mushroomTNImage.getImage(for: imageURL) { [weak self] (result) in
                        switch result {
                        case .failure(let error):
                            print(error)
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

