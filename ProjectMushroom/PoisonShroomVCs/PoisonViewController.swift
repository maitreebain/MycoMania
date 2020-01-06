//
//  PoisonViewController.swift
//  ProjectMushroom
//
//  Created by Maitree Bain on 1/3/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit

class PoisonViewController: UIViewController {
    
    @IBOutlet weak var poisonTableView: UITableView!
    
    var mushroom = [MushroomDataLoad]() {
        didSet {
            DispatchQueue.main.async {
                self.poisonTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        poisonTableView.dataSource = self
        poisonTableView.delegate = self
    }
    
    func loadPoisonShroomData() {
        
    }
    

}

extension PoisonViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mushroom.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "poisonCell", for: indexPath) as? PoisonCell else {
            fatalError("poisonCell not conformed")
        }
        
        
        //configure cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 160
    }
    
    
}
