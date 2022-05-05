//
//  ViewController.swift
//  Virtual Tourist Udacity
//
//  Created by Min Kaung Htet on 01/05/2022.
//

import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var mapView: MKMapView = {
        let mapView = MKMapView()
        return mapView
    }()
    var geocoder = CLGeocoder()
    let locationManager = CLLocationManager()
    var dataController: DataController!
    let regionKey: String = "persistedMapRegion"
    var pin: Pin?

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMapView()
        callPersistedLocation()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager.requestLocation()
            locationManager.startUpdatingLocation()
        }

        let longPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(MapViewController.handleLongPressGestureRecognizer(gestureRecognizer:)))
        self.mapView.addGestureRecognizer(longPressGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewWillAppear(animated)
    }


    // MARK: Setting Up Map View

    func setUpMapView() {
        
        mapView.delegate = self
        view.addSubview(mapView)
        mapView.overrideUserInterfaceStyle = .dark
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }

    // MARK: Setting up Gesture Recognizer
    
    @objc func handleLongPressGestureRecognizer(gestureRecognizer: UILongPressGestureRecognizer) {

        if gestureRecognizer.state != .ended {
            let tapLocation = gestureRecognizer.location(in: mapView)
            let coordinate = mapView.convert(tapLocation, toCoordinateFrom: mapView)
            print("Tapped at Latitude: \(coordinate.latitude), Tapped at Longitude: \(coordinate.longitude)")

            let pin = MKPointAnnotation()
            pin.coordinate = coordinate
            pin.title = "Latitude: \(coordinate.latitude), Longitude: \(coordinate.longitude)"
            mapView.addAnnotation(pin)

        }

        if gestureRecognizer.state == .began {
            return
        }
    }
}

extension MapViewController: CLLocationManagerDelegate, NSFetchedResultsControllerDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
           
           let reuseId = "pin"
           var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
           let pinAnnotation = annotation as! AnnotationPin
           pinAnnotation.title = pinAnnotation.pin.locationName
           pinAnnotation.subtitle = pinAnnotation.pin.country
           print("\(String(describing: pinAnnotation.title)) \(String(describing: pinAnnotation.subtitle))")
      
           if pinView == nil {
               pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
               pinView!.canShowCallout = true
               pinView!.pinTintColor = .red
               pinView!.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
               
           } else {
               pinView!.annotation = annotation
           }
           return pinView
       }
    
    func saveMapLocation() {
        let mapRegion = [
            "latitude" :        mapView.region.center.latitude,
            "longitude" :       mapView.region.center.longitude,
            "latitudeDelta" :   mapView.region.span.latitudeDelta,
            "longitudeDelta"  :  mapView.region.span.longitudeDelta
        ]
        UserDefaults.standard.set(mapRegion, forKey: regionKey)
    }
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        self.saveMapLocation()
    }
    
    func callPersistedLocation() {
        if let mapRegion = UserDefaults.standard.dictionary(forKey: regionKey) {
            let location = mapRegion as! [String: CLLocationDegrees]
            let center = CLLocationCoordinate2D(latitude: location["latitude"]!, longitude: location["longitude"]!)
            let span = MKCoordinateSpan(latitudeDelta: location["latitudeDelta"]!, longitudeDelta: location["longitudeDelta"]!)
            
            mapView.setRegion(MKCoordinateRegion(center: center, span: span), animated: true)
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {

        switch manager.authorizationStatus {
        case.authorizedAlways:
            return
        case.authorizedWhenInUse:
            return
        case.denied:
            return
        case.restricted:
            locationManager.requestWhenInUseAuthorization()
        case.notDetermined:
            locationManager.requestWhenInUseAuthorization()
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {

        print(error)
    }
}
