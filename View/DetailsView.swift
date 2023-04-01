//
//  DetailsView.swift
//  NobetciEczaneSwiftUIApp
//
//  Created by M.Ömer Ünver on 26.03.2023.
//

import SwiftUI
import MapKit
import SafariServices
struct DetailsView: View {
    @State private var showSafari: Bool = false

    let pharmacyAnnotation : pharmacy
    @Binding var selectedData: pharmacy?
    var body: some View {
        VStack{
            mapView(pharmacyAnnotation: pharmacyAnnotation, selectedData: $selectedData)
                        .edgesIgnoringSafeArea(.top)
                        .frame(height: UIScreen.main.bounds.height * 0.3)
            Text("Yol tarifi için harita üzerinde ki pin'e tıklayabilirsiniz")
                .font(.footnote)
            VStack {
                HStack {
                    Text(pharmacyAnnotation.eczaneAdi)
                        .foregroundColor(.red)
                        .font(.title3)
                        .bold()
                    Spacer()
                    Image(systemName: "phone.fill")
                        .foregroundColor(.blue)
                        .bold()
                    Text(pharmacyAnnotation.telefon)
                        .foregroundColor(.blue)
                        .font(.title3)
                        .onTapGesture {
                            guard let url = URL(string: "tel://\(pharmacyAnnotation.telefon)") else {return}
                            UIApplication.shared.open(url)
                        }
                }
                .padding(.bottom)
                VStack{
                    Text(pharmacyAnnotation.adresi)
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                }
                .offset(x: UIScreen.main.bounds.width * -0.03)
                Text("Google Maps ile Yol Tarifi Al")
                        .padding()
                        .onTapGesture {
                            showSafari.toggle()
                                
                        }
                        .fullScreenCover(isPresented: $showSafari, content: {
                                safariView(url: URL(string: "http://maps.google.com/maps?q=\(pharmacyAnnotation.latitude),\(pharmacyAnnotation.longitude)")!)
                        })
                    
                        .foregroundColor(.blue)
                        .font(.caption)

            }
            .padding()
            Spacer()
        }
    }
}

