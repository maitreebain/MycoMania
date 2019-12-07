//
//  ViewController.swift
//  ProjectMushroom
//
//  Created by Maitree Bain on 11/26/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class EdibleShroomViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadMushroomData()
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

