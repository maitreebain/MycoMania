//
//  ViewController.swift
//  ProjectMushroom
//
//  Created by Maitree Bain on 11/26/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class EdibleShroomViewController: UIViewController {

    @IBOutlet weak var edibleTableView: UITableView!
    
    var mushroom = [MushroomDataLoad]() {
        didSet {
            edibleTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMushroomData()
        edibleTableView.dataSource = self
        edibleTableView.delegate = self
    }
    
    
    func loadMushroomData() {
        
    }
    

}


extension  EdibleShroomViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mushroom.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "edibleCell", for: indexPath) as? EdibleCell else {
            fatalError("check cell name")
        }
        
        let selectedShroom = mushroom[indexPath.row]
        
        cell.configureCell(for: selectedShroom)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
