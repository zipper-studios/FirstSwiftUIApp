//
//  FormLabelTextView.swift
//  FirstSwiftUIApp
//
//  Created by Nicoleta Pop on 7/9/19.
//  Copyright © 2019 Nicoleta Pop. All rights reserved.
//

import SwiftUI

struct FormLabelTextView : View {
    var label: String
    var placeholder: String
    @Binding var textString: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            TextField($textString, placeholder: Text(placeholder))
                .padding(.all)
                .background(Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0), cornerRadius: 5.0)
            }
            .padding(.horizontal, 15)
    }
}

#if DEBUG
struct FormLabelTextView_Previews : PreviewProvider {
    static var previews: some View {
        FormLabelTextView(label: "City", placeholder: "Give me the city", textString: .constant("City name"))
    }
}
#endif
