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

    }
    
    func updateUI() {
        
    }
}
