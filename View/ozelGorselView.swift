//
//  ozelGorselView.swift
//  NobetciEczaneSwiftUIApp
//
//  Created by M.Ömer Ünver on 23.03.2023.
//

import SwiftUI

struct ozelGorselView: View {
    @State var image : Image
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 3))
            .shadow(radius: 5)
    }
}

struct ozelGorselView_Previews: PreviewProvider {
    static var previews: some View {
        ozelGorselView(image: Image("eczane"))
    }
}
