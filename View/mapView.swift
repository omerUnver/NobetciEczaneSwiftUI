//
//  mapView.swift
//  NobetciEczaneSwiftUIApp
//
//  Created by M.Ömer Ünver on 23.03.2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct mapView: UIViewRepresentable {
    let pharmacyAnnotation : pharmacy
    @Binding var selectedData : pharmacy?
    func updateUIView(_ mapView: MKMapView, context: Context) {
        if let selectedLocation = selectedData {
                   let coordinate = CLLocationCoordinate2D(latitude: selectedLocation.latitude, longitude: selectedLocation.longitude)
            let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
                   mapView.setRegion(region, animated: true)
                   mapView.annotations.forEach { annotation in
                       if let title = annotation.title, title == selectedLocation.eczaneAdi {
                           mapView.selectAnnotation(annotation, animated: true)
                       }
                   }
               }
           }
    
    func makeUIView(context: Context) -> MKMapView {
       let mapView =  MKMapView(frame: .zero)
        let coordinate = CLLocationCoordinate2D(latitude: pharmacyAnnotation.latitude, longitude: pharmacyAnnotation.longitude)
        let region = MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        mapView.setRegion(region, animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = pharmacyAnnotation.eczaneAdi
        annotation.subtitle = "Nöbetçi Eczane"
        mapView.addAnnotation(annotation)
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        mapView.delegate = context.coordinator
        return mapView
    }
    func makeCoordinator() -> Coordinator {
       return Coordinator()
    }
    
}
class Coordinator: NSObject, MKMapViewDelegate {
       func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
           guard let annotation = view.annotation else {
               return
           }
           let mapItem = MKMapItem(placemark: MKPlacemark(coordinate: annotation.coordinate))
           mapItem.name = annotation.title ?? "Selected Location"
           mapItem.openInMaps()
       }
   }


