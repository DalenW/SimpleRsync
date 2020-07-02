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
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.vertical, 10.0)
            
            HStack(spacing: 2) {
                Spacer()
                
                VStack {
                    VStack {
                        VStack {
                            TextField("Source Folder", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            TextField("Destination", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                            
                            Divider()
                            
                            HStack {
                                
                                ScrollView {
                                    TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                        .disabled(true)
                                        .frame(width: 300, height: 100, alignment: .leading)
                                }
                            }
                        }
                        .frame(width: 300.0)
                    }
                    
                }
                
                Spacer()
                Divider()
                Spacer()
                
                VStack {
                    Text(/*@START_MENU_TOKEN@*/"Options"/*@END_MENU_TOKEN@*/)
                        .font(.headline)
                    HStack {
                        VStack(alignment: .leading) {
                            Toggle(isOn: $ignoreErrorsBool) {
                                Text("Ignore Errors")
                            }
                            Toggle(isOn: $ignoreErrorsBool) {
                                Text("Recursive")
                            }
                            Toggle(isOn: $ignoreErrorsBool) {
                                Text("Update")
                            }
                            Toggle(isOn: $ignoreErrorsBool) {
                                Text("Compress")
                            }
                            Toggle(isOn: $ignoreErrorsBool) {
                                Text("Partial Progress")
                            }
                            
                        }
                        
                        VStack(alignment: .leading) {
                            Toggle(isOn: $ignoreErrorsBool) {
                                Text("Preserve Permissions")
                            }
                            Toggle(isOn: $ignoreErrorsBool) {
                                Text("Preserve Times")
                            }
                            Toggle(isOn: $ignoreErrorsBool) {
                                Text("Preserve Group")
                            }
                            Toggle(isOn: $ignoreErrorsBool) {
                                Text("Preserve Owner")
                            }
                            Toggle(isOn: $ignoreErrorsBool) {
                                Text("Archive")
                            }
                        }
                    }.frame(width: 300.0)
                    Spacer()
                }
                
                Spacer()

                
                
            }
            
            
            Button(action: {
                shell()
            }) {
                Text("Run")
            }.frame(minWidth: 400, idealWidth: 800, maxWidth: .infinity, minHeight: 300, idealHeight: 400, maxHeight: .infinity)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 800.0)
    }
}
