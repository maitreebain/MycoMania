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
            DispatchQueue.main.async {
                self.edibleTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMushroomData()
        edibleTableView.dataSource = self
        edibleTableView.delegate = self
    }
    
    
    func loadMushroomData() {
        
        ShroomsAPIClient.fetchData { (result) in
            
            switch result {
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let mushroomData):
                self.mushroom = mushroomData
            }
        }
        
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
        
        //image nested in data
        //api client -> network
        cell.configureCell(for: selectedShroom)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
