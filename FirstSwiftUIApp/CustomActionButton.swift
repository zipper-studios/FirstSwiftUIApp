//
//  CustomActionButton.swift
//  FirstSwiftUIApp
//
//  Created by Nicoleta Pop on 7/9/19.
//  Copyright © 2019 Nicoleta Pop. All rights reserved.
//

import SwiftUI

struct CustomActionButton : View {
    var body: some View {
        Button(action: {
            
        }) {
            HStack {
                Spacer()
                Text("Save")
                    .font(.headline)
                    .color(Color.red)
                Spacer()
            }
        }
        .padding(.vertical, 10.0)
        .cornerRadius(4.0)
        .padding(.horizontal, 50.0)
    }
}

#if DEBUG
struct CustomActionButton_Previews : PreviewProvider {
    static var previews: some View {
        CustomActionButton()
    }
}
#endif
