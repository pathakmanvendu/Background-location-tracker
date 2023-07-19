//
//  ViewController.swift
//  Background-Location-Tracker
//
//  Created by Manvendu Pathak on 11/07/23.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    private var locationManager: CLLocationManager?
    

    private let latLngLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .systemFill
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        latLngLabel.frame = CGRect(x: 20, y: view.bounds.height / 2 - 50, width: view.bounds.width - 40, height: 100)
        view.addSubview(latLngLabel)
        
        getUserLocation()
      
    }

    
    func getUserLocation(){
        locationManager = CLLocationManager()
        locationManager?.requestAlwaysAuthorization()
        locationManager?.startMonitoringSignificantLocationChanges()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        locationManager?.startUpdatingLocation()
        locationManager?.allowsBackgroundLocationUpdates = true
        locationManager?.delegate = self
    }
    
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
                latLngLabel.text = "Lat : \(location.coordinate.latitude) \nLng : \(location.coordinate.longitude)"
            }
    }
}

