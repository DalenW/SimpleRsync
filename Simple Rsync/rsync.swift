//
//  rsync.swift
//  Simple Rsync
//
//  Created by Dalen Ward on 7/1/20.
//  Copyright © 2020 m6securities. All rights reserved.
//

import Foundation

class Rsync: ObservableObject {
    @Published var output:String = "Not run yet"
    
    let task = Process()
    
    
    var command :String = "echo Hello"
    
    init() {
        
    }
    
    func run() {
        let pipe = Pipe()
        print(task.isRunning)
        
        task.standardOutput = pipe
        task.arguments = ["-c", command]
        task.launchPath = "/bin/zsh"
        
        do {
            try task.run()
        } catch is Any {
            print("Error")
        }
        

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        output = String(data: data, encoding: .utf8)!
        print(output)
        
    }
}


