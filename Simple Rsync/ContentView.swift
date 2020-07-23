//
//  ContentView.swift
//  Simple Rsync
//
//  Created by Dalen Ward on 7/1/20.
//  Copyright © 2020 m6securities. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var rsync:Rsync = Rsync()
    
    
    var body: some View {
        VStack {
            Text("Simple Rsync")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10.0)
            
            HStack(spacing: 2) {
                Spacer()
                
                VStack {
                    VStack {
                        TextField("Source Folder", text: $rsync.source)
                        TextField("Destination", text: $rsync.destination)
                        
                        Divider()
                        
                        TextField("Command", text: $rsync.command)
                        Button(action: {
                            self.rsync.generateCommand()               }) {
                            Text("Generate Command")
                        }
                    }
                    .frame(width: 300.0)
                    
                    
                    Spacer()
                }
                
                Spacer()
                Divider()
                Spacer()
                
                VStack {
                    Text(/*@START_MENU_TOKEN@*/"Options"/*@END_MENU_TOKEN@*/)
                        .font(.headline)
                    HStack {
                        VStack(alignment: .leading) {
                            Toggle(isOn: $rsync.toggleRecursive) {
                                Text("Recursive")
                            }
                            Toggle(isOn: $rsync.toggleUpdate) {
                                Text("Update")
                            }
                            Toggle(isOn: $rsync.toggleCompress) {
                                Text("Compress")
                            }
                            Toggle(isOn: $rsync.toggleProgress) {
                                Text("Partial Progress")
                            }
                            Toggle(isOn: $rsync.toggleReadable) {
                                Text("Human Readable")
                            }
                            Toggle(isOn: $rsync.toggleIgnoreErrors) {
                                Text("Ignore Errors")
                            }
                        }
                        
                        VStack(alignment: .leading) {
                            Toggle(isOn: $rsync.togglePermissions) {
                                Text("Preserve Permissions")
                            }
                            Toggle(isOn: $rsync.toggleTimes) {
                                Text("Preserve Times")
                            }
                            Toggle(isOn: $rsync.toggleGroup) {
                                Text("Preserve Group")
                            }
                            Toggle(isOn: $rsync.toggleOwner) {
                                Text("Preserve Owner")
                            }
                            Toggle(isOn: $rsync.toggleStats) {
                                Text("Stats")
                            }
                            
                            Spacer()
                        }
                    }.frame(width: 300.0)
                    Spacer()
                }
                
                Spacer()
            }
            Spacer()
            
            GeometryReader { geometry in
                ScrollView {
                    Text(self.rsync.getConsoleOutput())
                        .multilineTextAlignment(.leading)
                        .lineLimit(nil)
                        .padding(.leading, 5.0)
                        .colorScheme(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
                        .frame(width: geometry.size.width)
                        
        
                }
                .background(Color.gray)
            }
            .padding(.horizontal, 20.0)
            .frame(minWidth: 50, minHeight: 100)
            
            
            
            Spacer()
            
            HStack {
                Button(action: {
                    self.rsync.run()
                }) {
                    Text("Run")
                }
                Button(action: {
                    self.rsync.stopTask()
                }) {
                    Text("Stop")
                }
            }
            
            
            Spacer()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .frame(width: 800.0)
    }
}
