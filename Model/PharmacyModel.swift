//
//  pharmacyModel.swift
//  NobetciEczaneSwiftUIApp
//
//  Created by M.Ömer Ünver on 23.03.2023.
//

import Foundation
import CoreLocation
import SwiftUI
struct PharmacyModel : Codable {
    let data : [pharmacy]
    private enum CodingKeys : String, CodingKey {
        case data
    }
}

struct pharmacy : Codable{
    let eczaneAdi : String
    let adresi : String
    let semt : String
    let telefon : String
    let sehir : String
    let ilce : String
    let latitude : Double
    let longitude : Double
    var coordinateLocation : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)

    }
    let distanceKm : Double
    
    private enum CodingKeys : String, CodingKey {
                case eczaneAdi = "EczaneAdi"
                case adresi = "Adresi"
                case semt = "Semt"
                case telefon = "Telefon"
                case sehir = "Sehir"
                case ilce, latitude, longitude, distanceKm
        
                
    }
}
