//
//  PharmacyViewModel.swift
//  NobetciEczaneSwiftUIApp
//
//  Created by M.Ömer Ünver on 23.03.2023.
//

import Foundation
import CoreLocation
import MapKit
class PharmacyListViewModel : NSObject, ObservableObject{
    @Published var pharmacys = [PharmacyViewModel]()
    var locationManager = CLLocationManager()
    let downloaderClient = DownloaderClient()
    override init(){
        super.init()
        setupLocation()
    }
    
    public func setupLocation(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.stopUpdatingLocation()
    }
    public func setupLocation2(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
}
extension PharmacyListViewModel : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        downloaderClient.getLocation(latitude: latitude, longitude: longitude){ result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case.success(let pharmacyArray):
                if let pharmacyArray = pharmacyArray {
                    DispatchQueue.main.async {
                        self.pharmacys = pharmacyArray.map(PharmacyViewModel.init)
                        self.locationManager.stopUpdatingLocation()
                    }
                }
            }
        }
    }
   
}

struct PharmacyViewModel {
   
    let pharmacy : pharmacy
    var eczaneAdi : String {
        pharmacy.eczaneAdi
    }
    var adresi : String {
        pharmacy.adresi
    }
    var semt : String {
        pharmacy.semt
    }
    var telefon : String {
        pharmacy.telefon
    }
    var sehir : String {
        pharmacy.sehir
    }
    var ilce : String {
        pharmacy.ilce
    }
    var latitude : Double {
        pharmacy.latitude
    }
    var longitude : Double {
        pharmacy.longitude
    }
    var coordinateLocation : CLLocationCoordinate2D {
        pharmacy.coordinateLocation
    }
    var distanceKm : Double {
        pharmacy.distanceKm
    }
    
    
}

