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
    
    @IBOutlet weak var commonNameLabel: UILabel!
    
    @IBOutlet weak var regionsLabel: UILabel!
    
    
    
    
    var mushroom: MushroomDataLoad?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    func updateUI() {
        
        guard let mushroomInfo = mushroom else {
            print("no mushroomInfo found")
            return
        }
        
        detailTextView.text = mushroomInfo.habitat
        
        //maybe use empty string to store values, then add it to text label?
        //mushroomInfo.common.first ?
        for name in mushroomInfo.common {
            commonNameLabel.text = "\(name)"
        }
        for regions in mushroomInfo.regions {
            regionsLabel.text = "\(regions)"
        }
    }
}
