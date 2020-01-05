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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        poisonTableView.dataSource = self
        poisonTableView.delegate = self
    }
    

}

extension PoisonViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
    }
    
    
}
