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
    }
    
    
    func loadMushroomData() {
        
        ShroomsAPIClient.fetchData { result in
            switch result {
            case .failure(let error):
                //create a UIAlertController to present to the user
                let alert = UIAlertController(title: "Network Error", message: "\(error)", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                
                //always update UI on the Main thread
                DispatchQueue.main.async {
                    self.present(alert, animated: true, completion: nil)
                }
            case .success(let jokes):
                dump(jokes)
            }
        }
    }
    

}

extension  EdibleShroomViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mushroom.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: EdibleCell!
        
        guard let edibleCell = tableView.dequeueReusableCell(withIdentifier: "edibleCell", for: indexPath) as? EdibleCell else {
            fatalError("check cell name")
        }
        cell = edibleCell
        
        let selectedShroom = mushroom[indexPath.row]
        
        cell.configureCell(for: selectedShroom)
        
        return cell
    }
}
