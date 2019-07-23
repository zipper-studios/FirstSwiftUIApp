//
//  ContentCellView.swift
//  FirstSwiftUIApp
//
//  Created by Nicoleta Pop on 7/4/19.
//  Copyright © 2019 Nicoleta Pop. All rights reserved.
//

import SwiftUI
import UIKit

struct ContentCellView : View {
    @State var destination : Destination
    @State var image: Image?
    
    var body: some View {
        NavigationButton(destination: ContentDetailView(destination: destination)) {
            HStack {
                if ((UIImage(named: destination.city)) != nil) {
                    Image(destination.city)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 1))
                        .shadow(radius: 10)
                } else {
                    image!
                        .frame(width: 120, height: 120)
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 1))
                        .shadow(radius: 10)
                }
                Spacer()
                    .frame(width: 90, height: 20, alignment: .center)
                    .relativeWidth(20)
                VStack(alignment: .trailing) {
                    Text(destination.city.capitalized)
                        .font(.headline)
                        .bold()
                        .color(.init(.sRGB, red: 102/255, green: 76/255, blue: 76/255, opacity: 1.0))
                    Text("Read all about it")
                        .font(.subheadline)
                        .color(.init(.sRGB, red: 127/255, green: 102/255, blue: 102/255, opacity: 1.0))
                    
                }
            }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: Alignment.topLeading)
        }
    }
}

#if DEBUG
struct ContentCellView_Previews : PreviewProvider {
    static var previews: some View {
        ContentCellView(destination: Destination(city: "riga", country: "latvia"), image: nil)
    }
}
#endif
