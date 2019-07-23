//
//  ContentDetailView.swift
//  FirstSwiftUIApp
//
//  Created by Nicoleta Pop on 7/4/19.
//  Copyright © 2019 Nicoleta Pop. All rights reserved.
//

import SwiftUI

struct ContentDetailView : View {
    @State var destination: Destination
    
    var body: some View {
        VStack(alignment: .center) {
            Image(destination.country+"s")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .offset(y: -100)
                .padding(.bottom, -70)
                .padding(.top, 40)
            VStack(alignment: .center) {
                Text("Welcome to \(destination.city.capitalized)!")
                    .font(.title)
                    .color(.gray)
                    .frame(width: 360, height: 50)
                Spacer()
                   .frame(width: 20, height: 20)
                List {
                    Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book")
                    .lineLimit(nil)
                }
                .frame(minWidth: 0, idealWidth: UIScreen.main.bounds.size.width-20, maxWidth: UIScreen.main.bounds.size.width - 10, minHeight: 400, idealHeight: 400, maxHeight: 400, alignment: .center)
            }
        }
    }
}

#if DEBUG
struct ContentDetailView_Previews : PreviewProvider {
    static var previews: some View {
        ContentDetailView(destination: Destination(city: "riga", country: "latvia"))
    }
}
#endif
