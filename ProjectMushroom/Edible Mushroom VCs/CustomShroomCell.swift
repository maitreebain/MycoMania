//
//  CustomShroomCell.swift
//  ProjectMushroom
//
//  Created by Maitree Bain on 12/7/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class EdibleCell: UITableViewCell {
    
    @IBOutlet weak var mushroomTNImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var latinNameLabel: UILabel!
    
    @IBOutlet weak var fairyRingLabel: UILabel!
    
    var shroomImage: Image?
    
    
    func configureCell(for mushroom: MushroomDataLoad, chosenMushroom: String) {
        
        nameLabel.text = mushroom.common.last?.description
        latinNameLabel.text = mushroom.latin
        
        if mushroom.fairyRings == true {
            fairyRingLabel.text = "Fairyring Status: Present"
        }
        
        
        ShroomImagesAPIClient.fetchImage(for: chosenMushroom) { (result) in
            
            switch result {
            case .failure(let appError):
                print("no image displayed: \(appError)")
                DispatchQueue.main.async {
                    self.mushroomTNImage.image = UIImage(systemName: "xmark")
                }
            case .success(let image):
                self.shroomImage = image
                
                guard let imageURL = self.shroomImage?.largeImageURL else {
                    // TODO: default image
                    DispatchQueue.main.async {
                        self.mushroomTNImage.image = UIImage(systemName: "xmark")
                    }
                    return
                }
                
                DispatchQueue.main.async {
                self.mushroomTNImage.getImage(for: imageURL) { (result) in
                    switch result {
                    case .failure(let error):
                        print(error)
                    case .success(let image):
                        DispatchQueue.main.async {
                            self.mushroomTNImage.image = image
                        }
                    }
                }
                }
                
            }
        }
        
        
    }
}
