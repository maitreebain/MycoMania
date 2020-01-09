//
//  EdibleDetailController.swift
//  ProjectMushroom
//
//  Created by Maitree Bain on 12/6/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class EdibleDetailController: UIViewController {

    @IBOutlet weak var detailImage: UIImageView!
    
    @IBOutlet weak var detailTextView: UITextView!
    
    @IBOutlet weak var commonNameLabel: UITextView!
    
    @IBOutlet weak var regionsLabel: UITextView!
    
    var mushroom: MushroomDataLoad?
    var shroomImage: Image?
    
    var defaultMushroom = "https://vignette.wikia.nocookie.net/nintendo/images/5/5b/Mushroom1.jpg/revision/latest?cb=20111104224030&path-prefix=en"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        navigationItem.title = mushroom?.common.last
    }
    
    func updateUI() {
        
        guard let mushroomInfo = mushroom else {
            print("no mushroomInfo found")
            return
        }
        
        detailTextView.text = mushroomInfo.habitat
        
        //maybe use empty string to store values, then add it to text label?
        //mushroomInfo.common.first ?
        for name in mushroomInfo.common{
            commonNameLabel.text = "\(name)\n"
        }
        
        for regions in mushroomInfo.regions {
            regionsLabel.text = "\(regions)"
        }
        
        ShroomImagesAPIClient.fetchImage(for: mushroomInfo.latin) { (result) in
            
            switch result {
            case .failure(let appError):
                print("no selected shroom pic shown \(appError)")
                DispatchQueue.main.async {
                    self.detailImage.getImage(for: self.defaultMushroom) { (result) in
                        
                        switch result{
                        case .failure(let appError):
                            print("default pic not shown: \(appError)")
                            DispatchQueue.main.async {
                                self.detailImage.image = UIImage(systemName: "star.fill")
                            }
                        case .success(let defaultImage):
                            DispatchQueue.main.async {
                                self.detailImage.image = defaultImage
                            }
                            
                        }
                    }
                }
            case .success(let image):
                self.shroomImage = image
                
                guard let shroomPicURL = self.shroomImage?.largeImageURL else{
                    DispatchQueue.main.async {
                        self.detailImage.image = UIImage(systemName: "o.circle")
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    self.detailImage.getImage(for: shroomPicURL) { (result) in
                        
                        switch result{
                            case .failure(let error):
                                print(error)
                            case .success(let image):
                                DispatchQueue.main.async {
                                    self.detailImage.image = image
                        }
                        }
                    }
                }
            }
        }
    }
    
}
