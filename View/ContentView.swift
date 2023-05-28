//
//  ContentView.swift
//  NobetciEczaneSwiftUIApp
//
//  Created by M.Ömer Ünver on 23.03.2023.
//

import SwiftUI
import CoreLocation


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
                            }
                            label: {
                                ozelGorselView(image: Image("eczane"))
                                    .frame(width: UIScreen.main.bounds.width  * 0.15, height: UIScreen.main.bounds.height * 0.1)
                                    .padding(.leading)
                                
                                VStack(alignment: .leading){
                                    Text(eczane.eczaneAdi)
                                        .font(.title3)
                                        .bold()
                                        .padding(.bottom, 2.5)
                                    Text(eczane.ilce)
                                        .font(.body)
                                        .foregroundColor(.red)
                                        .padding(.bottom, 2.5)
                                    HStack{
                                        Image(systemName: "mappin")
                                        Text(eczane.adresi)
                                            .font(.caption2)
                                            .fontWeight(.regular)
                                            
                                            .lineLimit(nil)
                                    }
                                        .padding(.bottom, 2.5)
                                    HStack{
                                        Image(systemName: "phone.fill")
                                        Text(eczane.telefon)
                                            .frame(width: UIScreen.main.bounds.width * 0.4)
                                            .lineLimit(nil)
                                            .onTapGesture {
                                                guard let url = URL(string: "tel://\(eczane.telefon)") else {return}
                                                UIApplication.shared.open(url)
                                            }
                                        Text("\(eczane.distanceKm,specifier: "%.2f") KM")
                                            .font(.caption)
                                            .padding(.leading, 20)
                                            .frame(width: UIScreen.main.bounds.width * 0.2)
                                    }
                                }
                                
                                Spacer()
                                
                            }
                        }
                }
                
                .refreshable {
                    DispatchQueue.main.async {
                        pharmacyListViewModel.setupLocation()
                    }
                }
                
                .listStyle(.inset)
                .scrollIndicators(.hidden)
                .task {
                    DispatchQueue.main.async {
                        pharmacyListViewModel.setupLocation2()
                    }
                }
                
            .navigationTitle(Text("Nöbetçi Eczaneler"))
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                        NavigationLink {
//
//                        } label: {
//                            Image(systemName: "map.fill")
//                                .foregroundColor(.red)
//                        }
//                }
//            }
            
 
        }
        
           
//        GADBannerViewController()
//            .frame(width: 320, height: 50)
//
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
}


