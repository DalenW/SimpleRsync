//
//  ContentView.swift
//  Simple Rsync
//
//  Created by Dalen Ward on 7/1/20.
//  Copyright © 2020 m6securities. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var ignoreErrorsBool = true
    
    var body: some View {
        VStack {
            Text("Simple Rsync")
                .padding(.vertical, 10.0)
            
            HStack {
                VStack {
                    TextField("Source Folder", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    TextField("Destination", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                }
                
                VStack {

                    Toggle(isOn: $ignoreErrorsBool) {
                        Text("Ignore Errors")
                    }.padding()
                    
                    if ignoreErrorsBool {
                        Text("Ignoring")
                    }
                }
            }
            
            Button(action: {
                print("Button Pressed")
                
                shell()
            }) {
                Text("Run")
            }.frame(minWidth: 400, idealWidth: 600, maxWidth: .infinity, minHeight: 300, idealHeight: 400, maxHeight: .infinity)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
