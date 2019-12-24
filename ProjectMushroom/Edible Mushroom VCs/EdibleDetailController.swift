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
        
        var counter = 0
        var index = 0
        
        guard let mushroomInfo = mushroom else {
            print("no mushroomInfo found")
            return
        }
        
        detailTextView.text = mushroomInfo.habitat
        
        //mushroomInfo.common.first ?
        
        for info in mushroomInfo.common {
            if info == mushroomInfo.common[index]{
            commonNameLabel.text = "Common names: \n\(info)"
            print(info)
            counter += 1
            index += 1
            }
            if counter > 1 {

                mushroomInfo.common[index]
                commonNameLabel.text = "\n\(info)"
                print(info)
            }
            print(mushroomInfo.common)
            print(info)
        }
        
        for regions in mushroomInfo.regions{
        regionsLabel.text = "Found in regions: \n\(regions)"
        }
    }
}
