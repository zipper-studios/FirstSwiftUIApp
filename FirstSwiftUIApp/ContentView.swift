//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by Nicoleta Pop on 6/26/19.
//  Copyright © 2019 Nicoleta Pop. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var destinations = [
        Destination(city: "amsterdam", country: "netherlands"),
        Destination(city: "cavtat", country: "croatia"),
        Destination(city: "florence", country: "italy"),
        Destination(city: "kotor", country: "croatia"),
        Destination(city: "london", country: "united-kingdom"),
        Destination(city: "metz", country: "france"),
        Destination(city: "milan", country: "italy"),
        Destination(city: "montpellier", country: "france"),
        Destination(city: "mullerthal", country: "luxembourg"),
        Destination(city: "riga", country: "latvia"),
        Destination(city: "rome", country: "italy"),
        Destination(city: "sainte-maxime", country: "france")]
    var countries = ["Croatia", "France", "Italy", "Latvia", "Luxembourg", "Netherlands", "United-Kingdom"]
    
    @State var isPresented = false
    @State var image: Image? = nil
    @State var showImagePicker: Bool = false
    @State var canSave: Bool = false
    @State var selectedCountry = 3
    
    @State var textFieldString: String
    
    var modal: some View {
        NavigationView {
            ZStack {
                List {
                    VStack(alignment: .leading) {
                        FormLabelTextView(label: "Destination City", placeholder: "Fill in the city name", textString: $textFieldString)
                    //FormLabelTextView(label: "Country", placeholder: "Fill in the mother country")
                        VStack(alignment: .leading) {
                            Text("Country")
                                .font(.headline)
                            Picker(selection: $selectedCountry, label: Text("Country")) {
                                ForEach(0 ..< countries.count) {
                                    Text(self.countries[$0])
                                        .frame(width: 200, height: 30, alignment: .center)
                                
                                    }
                                }
                                .padding(.all)
                            }
                            .padding(.horizontal, 15)
                    
                        VStack(alignment: .leading) {
                            Text("Cover Image")
                                .font(.headline)
                        
                            Spacer()
                                .frame(width: 20, height: 20)
                        
                            HStack {
                                image?
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            
                                Button(action: {
                                    self.showImagePicker.toggle()
                                    print("Image picker bool: \(self.showImagePicker)")
                                }, label: {
                                    Text("Pick image")
                                })
                                .disabled(showImagePicker)

                                }
                            }
                            .padding(.horizontal, 15)
                    
                    //if showImagePicker {
                        //ImagePicker(isShown: $showImagePicker, image: $image)
                          //  .frame(width: UIScreen.main.bounds.size.width-40, height: UIScreen.main.bounds.size.height/2)
                    //}
    
                        Spacer()
                            .frame(width: 100, height: 100)
                        VStack {
                            Button(action: {
                                
                                guard self.isModalValid() else {
                                    print("Modal is not valid!")
                                    return
                                }
                                
                                print("Save button pressed")
                                
                                self.showImagePicker = false
                                self.isPresented = false
                                self.canSave = false
                                
                                let destination = Destination(city: self.textFieldString, country: self.countries[self.selectedCountry].lowercased())
                                self.destinations.append(destination)
                                
                                self.textFieldString = ""
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
                                .disabled(canSave)
                        
                        }
                    }
                }
                .listRowInsets(EdgeInsets())
                .navigationBarTitle(Text("Add new destination"))
                
                if showImagePicker {
                    ImagePicker(isShown: $showImagePicker, image: $image)
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(self.destinations.identified(by: \.self)) { destination in
                        ContentCellView(destination: destination, image: self.image)
                    }
                }
                .navigationBarTitle(Text("Europe's Best"))
                .navigationBarItems(trailing: Button(action: {
                        self.isPresented = true
                        self.image = nil
                    }, label: {
                        Text("Add")
                    }))
                    .presentation(isPresented ? Modal(modal, onDismiss: {
                        self.isPresented.toggle()
                        self.image = nil
                        }
                    ) : nil)
            }
        }
            
    }
    
    func isModalValid() -> Bool {
        guard textFieldString != "City name", textFieldString != "", let _ = image else {
            return false
        }
        
        canSave = true
        return true
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView(textFieldString: "something")
    }
}
#endif
