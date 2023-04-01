//
//  SplashScreen.swift
//  NobetciEczaneSwiftUIApp
//
//  Created by M.Ömer Ünver on 24.03.2023.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack{
                VStack{
                    
                    ozelGorselView(image: Image("eczane"))
                        .frame(width: UIScreen.main.bounds.width * 0.3, height: UIScreen.main.bounds.height * 0.2)
                        .overlay(Circle().stroke(Color.red, lineWidth: 10))
                      
                    Text("Nöbetçi Eczane")
                        .font(.largeTitle)
                        .bold()
                
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.5)) {
                        self.size = 1
                        self.opacity = 3.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    withAnimation {
                        self.isActive = true
                    }
                    
                }
            }
        }
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
