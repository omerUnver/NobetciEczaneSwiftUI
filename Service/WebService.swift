//
//  WebService.swift
//  NobetciEczaneSwiftUIApp
//
//  Created by M.Ömer Ünver on 23.03.2023.
//

import Foundation
import CoreLocation
class DownloaderClient: NSObject{
    var apikey = ""
    func getLocation(latitude : Double, longitude : Double, completion : @escaping(Result<[pharmacy]?,DownloaderError>)-> Void){
        guard let url = URL(string:"https://www.nosyapi.com/apiv2/pharmacy/distance?latitude=\(latitude)&longitude=\(longitude)&apikey=\(apikey)") else {
            return completion(.failure(.yanlisUrl))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data , error == nil else {
                return completion(.failure(.VeriGelmedi))
            }
           
            guard let pharmacy = try? JSONDecoder().decode(PharmacyModel.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            
            print(pharmacy)
            completion(.success(pharmacy.data))
        } .resume()
    }
    
}

enum DownloaderError : Error {
    case yanlisUrl
    case VeriGelmedi
    case veriIslenemedi
}
