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
    
    
    func configureCell(for mushroom: MushroomDataLoad) {
        
        nameLabel.text = mushroom.common.last?.description
        latinNameLabel.text = mushroom.latin
        
        if mushroom.fairyRings == true {
            fairyRingLabel.text = "Fairyring Status: Present"
        }
    }
}
