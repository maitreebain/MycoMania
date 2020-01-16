//
//  ViewController.swift
//  ProjectMushroom
//
//  Created by Maitree Bain on 11/26/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class EdibleShroomViewController: UIViewController {
    
    @IBOutlet weak var shroomCollection: UICollectionView!
    
    @IBOutlet weak var edibleSearchBar: UISearchBar!
    
    
    var edibleMushrooms = [MushroomDataLoad]() {
        didSet {
            DispatchQueue.main.async {
                
                self.shroomCollection.reloadData()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .brown
        loadMushroomData()
        shroomCollection.dataSource = self
        shroomCollection.delegate = self
        edibleSearchBar.delegate = self
    }
    
    
    func loadMushroomData() {
        
        ShroomsAPIClient.fetchData { [weak self](result) in
            
            switch result {
            case .failure(let appError):
                print("appError: \(appError)")
            case .success(let mushroomData):
                self?.edibleMushrooms = mushroomData.filter {
                    $0.attributes.deadly == false &&
                        $0.attributes.poisonous == false &&
                        $0.attributes.psychoactive == false
                }
                
            }
            
            
        }
        
    }
    
    var searchQuery = "" {
        didSet {
            searchBarQuery()
        }
    }
    
    
    func searchBarQuery() {
        edibleMushrooms = edibleMushrooms.filter {$0.latin.lowercased().contains(searchQuery.lowercased())}
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let detailController = segue.destination as? EdibleDetailController,
                let indexPath = shroomCollection.indexPathsForSelectedItems?.first else {
                    fatalError("no segue found")
            }
            let shroomSelected = edibleMushrooms[indexPath.row]

            detailController.mushroom = shroomSelected
            detailController.view.backgroundColor = .brown
        }

    
}


extension  EdibleShroomViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return edibleMushrooms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = shroomCollection.dequeueReusableCell(withReuseIdentifier: "edibleShroom", for: indexPath) as? ShroomCollectionCell else {
            fatalError("does not conform to cell")
        }
        
        let selectedShroom = edibleMushrooms[indexPath.row]
        
        cell.configureCell(for: selectedShroom, chosenMushroom: selectedShroom.latin)
        
        return cell
    }
    

    
}

extension  EdibleShroomViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let interItemSpacing: CGFloat = 4
        let maxWidth = UIScreen.main.bounds.size.width
        let numberOfItems: CGFloat = 2
        let totalSpacing: CGFloat = numberOfItems * interItemSpacing
        let itemWidth: CGFloat = (maxWidth - totalSpacing) / numberOfItems
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    
    
}


extension EdibleShroomViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count == 0 {
            loadMushroomData()
            return
        }
        
        searchQuery = searchText
    }
    
}
