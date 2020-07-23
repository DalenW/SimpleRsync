//
//  Rsync.swift
//  Simple Rsync
//
//  Created by Dalen Ward on 7/23/20.
//  Copyright © 2020 m6securities. All rights reserved.
//

import Foundation

import Foundation

class Rsync: ObservableObject {
    @Published private var consoleOutput:String = "Not run yet"
    
    @Published var toggleIgnoreErrors:Bool = true
    @Published var toggleRecursive:Bool = true
    @Published var toggleUpdate:Bool = true
    @Published var toggleCompress:Bool = false
    @Published var toggleProgress:Bool = true
    @Published var togglePermissions:Bool = false
    @Published var toggleTimes:Bool = true
    @Published var toggleGroup:Bool = false
    @Published var toggleOwner:Bool = false
    @Published var toggleArchive:Bool = false
    
    let task = Process()
    
    
    var command :String = "echo Hello"
    
    init() {
        
    }
    
    //MARK: - Core function
    func run() {
        let pipe = Pipe()
        //print(task.isRunning)
        
        task.standardOutput = pipe
        task.arguments = ["-c", command]
        task.launchPath = "/bin/zsh"
        
        do {
            try task.run()
        } catch is Any {
            print("Error")
        }
        

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        self.consoleOutput = String(data: data, encoding: .utf8)!
        print(self.consoleOutput)
        
    }
    
    //MARK: - Getters and Setters
    
    func getConsoleOutput() -> String {
        return self.consoleOutput
    }
}
