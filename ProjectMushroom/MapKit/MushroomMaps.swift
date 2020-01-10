//
//  MushroomMaps.swift
//  ProjectMushroom
//
//  Created by Maitree Bain on 1/8/20.
//  Copyright © 2020 Maitree Bain. All rights reserved.
//

import UIKit
import MapKit

class MushroomMaps: UIViewController {

    struct LocationInfo {
        var name: String
        var coordinates: CLLocationCoordinate2D
    }
    
    var mushroomData = [MushroomDataLoad]()
    
    static func getLocation(){
        
    var continentLocation = [LocationInfo(name: "North America", coordinates: CLLocationCoordinate2D(latitude: 54.5260, longitude: 105.2551)),
                             LocationInfo(name: "Asia", coordinates: CLLocationCoordinate2D(latitude: 34.0479, longitude: 100.6197))
        ]
        
        var location = [LocationInfo(name: "Britain", coordinates: CLLocationCoordinate2D(latitude: 55.3781, longitude: 3.4360)),
                        LocationInfo(name: "Iran", coordinates: CLLocationCoordinate2D(latitude: 32.4279, longitude: 53.6880)),
                        
                        
                        
    ]
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
//add button to segue into maps, and add mapKit
    
    
    
}
