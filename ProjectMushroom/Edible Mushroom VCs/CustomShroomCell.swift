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
    
    var defaultMushroom = "https://vignette.wikia.nocookie.net/nintendo/images/5/5b/Mushroom1.jpg/revision/latest?cb=20111104224030&path-prefix=en"
    
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
                    self.mushroomTNImage.getImage(for: self.defaultMushroom) { (result) in
                        
                        switch result{
                        case .failure(let appError):
                            print("default pic not shown: \(appError)")
                            DispatchQueue.main.async {
                                self.mushroomTNImage.image = UIImage(systemName: "star.fill")
                            }
                        case .success(let defaultImage):
                            DispatchQueue.main.async {
                                self.mushroomTNImage.image = defaultImage
                            }
                            
                        }
                    }
                }
            case .success(let image):
                self.shroomImage = image
                
                guard let imageURL = self.shroomImage?.largeImageURL else {
                    // TODO: default image
                    DispatchQueue.main.async {
                        self.mushroomTNImage.image = UIImage(systemName: "o.circle")
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
