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

    @IBOutlet weak var map: MKMapView!
    
    @IBOutlet weak var continentSegment: UISegmentedControl!
    
    struct LocationInfo {
        var name: String
        var coordinates: CLLocationCoordinate2D
    }
    
    var mushroomData: MushroomDataLoad!
    
    var continents = ["Asia", "Europe", "Australia", "Africa", "North America", "South America"]
    
    var selectedContinentSeg: Int = 0 {
        didSet{
            switch continentSegment.selectedSegmentIndex {
            case 0:
                continentSegment.setTitle(continents[0], forSegmentAt: 0)
            case 1:
                continentSegment.setTitle(continents[1], forSegmentAt: 1)
            case 2:
                continentSegment.setTitle(continents[2], forSegmentAt: 2)
            case 3:
                continentSegment.setTitle(continents[3], forSegmentAt: 3)
            case 4:
                continentSegment.setTitle(continents[4], forSegmentAt: 4)
            case 5:
                continentSegment.setTitle(continents[5], forSegmentAt: 5)
            case 6:
                continentSegment.setTitle(continents[6], forSegmentAt: 6)
            default:
                continentSegment.setTitle(continents[0], forSegmentAt: 0)
            }
        }
    }
    
    var locations = [LocationInfo(name: "North America", coordinates: CLLocationCoordinate2D(latitude: 54.5260, longitude: 105.2551)),
                    LocationInfo(name: "Asia", coordinates: CLLocationCoordinate2D(latitude: 34.0479, longitude: 100.6197)),
                    LocationInfo(name: "Europe", coordinates: CLLocationCoordinate2D(latitude: 54.5260, longitude: 15.2551)),
                    LocationInfo(name: "Australia", coordinates: CLLocationCoordinate2D(latitude: 25.2744, longitude: 133.7751)),
                    LocationInfo(name: "Africa", coordinates: CLLocationCoordinate2D(latitude: 8.7832, longitude: 34.5085)),
                    LocationInfo(name: "South America", coordinates: CLLocationCoordinate2D(latitude: 8.7832, longitude: 55.4915)),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
//    struct MapView {
//        var coordinates: CLLocationCoordinate2D
//    }
//
//
//    func updateMap(_ uiView: MKMapView, context: CGContext){
//
//        let span = MKCoordinateSpan(latitudeDelta: 0.7, longitudeDelta: 0.7)
//        let area = MKCoordinateRegion(center: coordinates, span: span)
//    }
    
    @IBAction func continentAction(_ sender: UISegmentedControl) {
        selectedContinentSeg = sender.selectedSegmentIndex
        
       
//        updateMap(map, context: selectedContinentSeg as! CGContext)
    }
    
}
