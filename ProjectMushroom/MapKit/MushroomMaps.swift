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
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var continentSegment: UISegmentedControl!
    
    var mushroomData: MushroomDataLoad?
    
    var continents = ["Asia", "Europe", "Australia", "Africa", "North America", "South America"]
    
    var selectedContinentSeg: Int = 4 {
        didSet{
            switch continentSegment.selectedSegmentIndex {
            case 0:
                continentSegment.setTitle(continents[0], forSegmentAt: 0)

                if mushroomData?.regions.contains("Asia") ?? false{
                let region = MKCoordinateRegion(center: locations["Asia"] ?? locations["North America"]!, span: MKCoordinateSpan(latitudeDelta: 60, longitudeDelta: 60))
                    self.mapView.setRegion(region, animated: true)} else {
                    self.showAlert(title: "Error 4🍄4:", message: "Shroom cannot be found in this area!")
                }
            case 1:
                continentSegment.setTitle(continents[1], forSegmentAt: 1)
                
                if mushroomData?.regions.contains("Europe") ?? false{
                let region = MKCoordinateRegion(center: locations["Europe"] ?? locations["North America"]!, span: MKCoordinateSpan(latitudeDelta: 60, longitudeDelta: 60))
                    self.mapView.setRegion(region, animated: true)
                } else {
                    self.showAlert(title: "Error 4🍄4:", message: "Shroom cannot be found on this map!")
                }
            case 2:
                continentSegment.setTitle(continents[2], forSegmentAt: 2)
                
                if mushroomData?.regions.contains("Australia") ?? false{
                let region = MKCoordinateRegion(center: locations["Australia"] ?? locations["North America"]!, span: MKCoordinateSpan(latitudeDelta: 60, longitudeDelta: 60))
                self.mapView.setRegion(region, animated: true)
                } else {
                    self.showAlert(title: "Error 4🍄4:", message: "Shroom cannot be found on this map!")
                }
            case 3:
                continentSegment.setTitle(continents[3], forSegmentAt: 3)

                if mushroomData?.regions.contains("Africa") ?? false {
                let region = MKCoordinateRegion(center: locations["Africa"] ?? locations["North America"]!, span: MKCoordinateSpan(latitudeDelta: 60, longitudeDelta: 60))
                    self.mapView.setRegion(region, animated: true)} else{
                    self.showAlert(title: "Error 4🍄4:", message: "Shroom cannot be found on this map!")
                }
            case 4:
                continentSegment.setTitle(continents[4], forSegmentAt: 4)

                if mushroomData?.regions.contains("North America") ?? false {
                    let region = MKCoordinateRegion(center: locations["North America"] ?? locations["North America"]!, span: MKCoordinateSpan(latitudeDelta: 60, longitudeDelta: 60))
                    self.mapView.setRegion(region, animated: true)
                } else {
                    self.showAlert(title: "Error 4🍄4:", message: "Shroom cannot be found on this map!")
                }
            case 5:
                continentSegment.setTitle(continents[5], forSegmentAt: 5)
                
                if mushroomData?.regions.contains("South America") ?? false{
                let region = MKCoordinateRegion(center: locations["South America"] ?? locations["North America"]!, span: MKCoordinateSpan(latitudeDelta: 60, longitudeDelta: 60))
                    self.mapView.setRegion(region, animated: true)} else {
                        self.showAlert(title: "Error 4🍄4:", message: "Shroom cannot be found on this map!")
                    }
            default:
                continentSegment.setTitle(continents[4], forSegmentAt: 4)
                
                let region = MKCoordinateRegion(center: locations["North America"] ?? locations["South America"]!, span: MKCoordinateSpan(latitudeDelta: 60, longitudeDelta: 60))

                self.mapView.setRegion(region, animated: true)
            }
        }
    }
    
    var locations: [String: CLLocationCoordinate2D] =
        ["North America": CLLocationCoordinate2D(latitude: 37.0902, longitude: 95.7129),
                                                       "Asia": CLLocationCoordinate2D(latitude: 34.0479, longitude: 100.6197),
                                                       "Europe": CLLocationCoordinate2D(latitude: 54.5260, longitude: 15.2551),
                                                       "Australia": CLLocationCoordinate2D(latitude: 25.2744, longitude: 133.7751),
                                                       "Africa": CLLocationCoordinate2D(latitude: 8.7832, longitude: 34.5085),
                                                       "South America": CLLocationCoordinate2D(latitude: 8.7832, longitude: 55.4915),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func continentAction(_ sender: UISegmentedControl) {
        selectedContinentSeg = sender.selectedSegmentIndex

    }
    
}
