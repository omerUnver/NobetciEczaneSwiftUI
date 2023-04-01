//
//  ContentView.swift
//  NobetciEczaneSwiftUIApp
//
//  Created by M.Ömer Ünver on 23.03.2023.
//

import SwiftUI
import CoreLocation
import MapKit
struct ContentView: View {
    @ObservedObject var pharmacyListViewModel : PharmacyListViewModel
    @State private var selectedData: pharmacy?
    
    init() {
        self.pharmacyListViewModel = PharmacyListViewModel()
        
    }
    var body: some View {
        NavigationView {
            List(pharmacyListViewModel.pharmacys, id: \.eczaneAdi) { eczane in
                HStack{
                    NavigationLink {
                        DetailsView(pharmacyAnnotation: eczane.pharmacy, selectedData: $selectedData)
                    } label: {
                        ozelGorselView(image: Image("eczane"))
                            .frame(width: UIScreen.main.bounds.width  * 0.15, height: UIScreen.main.bounds.height * 0.2)
                            .padding(.leading)
                        
                        VStack(alignment: .leading){
                            Text(eczane.eczaneAdi)
                                .font(.title2)
                                .bold()
                                .padding(.bottom)
                            HStack{
                                Image(systemName: "phone.fill")
                                    .foregroundColor(.blue)
                                    .padding(.bottom)
                                    .padding(.leading)
                                Text(eczane.telefon)
                                    .padding(.bottom)
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        guard let url = URL(string: "tel://\(eczane.telefon)") else {return}
                                        UIApplication.shared.open(url)
                                    }
                            }
                           
                            HStack{
                                
                                Text(eczane.ilce)
                                    .font(.title3)
                                    .offset(x: UIScreen.main.bounds.width * 0.01)
                                Text("/\(eczane.sehir)")
                                    .font(.title3)
                                    .offset(x: UIScreen.main.bounds.width * -0.01)
                            }
                        }
                        
                        Spacer()
                        
                    }
                    
                }
            }
            .scrollIndicators(.hidden)
            .task {
                DispatchQueue.main.async {
                    pharmacyListViewModel.setupLocation()
                }
            }
             .navigationTitle(Text("Nöbetçi Eczaneler"))
        }
    
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}
