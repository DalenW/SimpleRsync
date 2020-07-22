//
//  rsync.swift
//  Simple Rsync
//
//  Created by Dalen Ward on 7/1/20.
//  Copyright © 2020 m6securities. All rights reserved.
//

import Foundation

func shell() {
    //print("starting shell")
    
    let task = Process()
    let pipe = Pipe()
    
    var command :String = "echo Hello"

    task.standardOutput = pipe
    task.arguments = ["-c", command]
    task.launchPath = "/bin/zsh"
    task.launch()

    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    let output = String(data: data, encoding: .utf8)!
    
    print(output)
}
