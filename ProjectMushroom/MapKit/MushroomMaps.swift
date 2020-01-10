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
    
    var continentLocation = [LocationInfo(name: "North America", coordinates: CLLocationCoordinate2D(latitude: 54.5260, longitude: 105.2551)),
                             LocationInfo(name: "Asia", coordinates: CLLocationCoordinate2D(latitude: 34.0479, longitude: 100.6197)),
                             LocationInfo(name: "Europe", coordinates: CLLocationCoordinate2D(latitude: 54.5260, longitude: 15.2551)),
                             LocationInfo(name: "Australia", coordinates: CLLocationCoordinate2D(latitude: 25.2744, longitude: 133.7751)),
                             LocationInfo(name: "Africa", coordinates: CLLocationCoordinate2D(latitude: 8.7832, longitude: 34.5085)),
                             LocationInfo(name: "South America", coordinates: CLLocationCoordinate2D(latitude: 8.7832, longitude: 55.4915))
        ]
        
    var location = [
                        LocationInfo(name: "Northern Africa", coordinates: CLLocationCoordinate2D(latitude: 26.0198, longitude: 32.2778)),
                        LocationInfo(name: "South Africa", coordinates: CLLocationCoordinate2D(latitude: 30.5595, longitude: 22.9375)),
                        LocationInfo(name: "Eastern Europe", coordinates: CLLocationCoordinate2D(latitude: 52.0055, longitude: 37.9587)),
                        LocationInfo(name: "Central Asia", coordinates: CLLocationCoordinate2D(latitude: 45.4507, longitude: 68.8319)),
                        LocationInfo(name: "East Asia", coordinates: CLLocationCoordinate2D(latitude: 38.7946, longitude: 106.5348)),
                        LocationInfo(name: "Central America", coordinates: CLLocationCoordinate2D(latitude: 12.7690, longitude: 85.6024)),
                        LocationInfo(name: "Britain", coordinates: CLLocationCoordinate2D(latitude: 55.3781, longitude: 3.4360)),
                        LocationInfo(name: "Iran", coordinates: CLLocationCoordinate2D(latitude: 32.4279, longitude: 53.6880)),
                        LocationInfo(name: "New Zealand", coordinates: CLLocationCoordinate2D(latitude: 40.9006, longitude: 174.8860)),
                        LocationInfo(name: "Japan", coordinates: CLLocationCoordinate2D(latitude: 36.2048, longitude: 138.2529)),
                        LocationInfo(name: "Scandinavia", coordinates: CLLocationCoordinate2D(latitude: 62.2786, longitude: 12.3402)),
                        LocationInfo(name: "Caribbean", coordinates: CLLocationCoordinate2D(latitude: 21.4691, longitude: 78.6569)),
                        LocationInfo(name: "Alaska", coordinates: CLLocationCoordinate2D(latitude: 64.2008, longitude: 149.4937))
    ]
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
//add button to segue into maps, and add mapKit
    
    
    
}
