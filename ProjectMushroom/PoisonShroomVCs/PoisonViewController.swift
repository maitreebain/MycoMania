//
//  PoisonViewController.swift
//  ProjectMushroom
//
//  Created by Maitree Bain on 1/3/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit

class PoisonViewController: UIViewController {
    
    @IBOutlet weak var poisonCollection: UICollectionView!
    
    var mushrooms = [MushroomDataLoad]() {
        didSet {
            DispatchQueue.main.async {
                self.poisonCollection.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func loadPoisonShroomData() {
           
           ShroomsAPIClient.fetchData { (result) in
               
               switch result {
               case .failure(let appError):
                   print("appError: \(appError)")
               case .success(let mushroomData):
                   self.mushrooms = mushroomData
               }
               
               
           }
        
    }
    

}

