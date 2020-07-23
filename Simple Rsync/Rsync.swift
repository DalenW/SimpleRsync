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
    
    private let task = Process()
    private let pipe = Pipe()
    
    var command :String = ""
    
    //MARK: - Published Variables
    @Published private var consoleOutput:String = "Not run yet"
    
    @Published var source:String = ""
    @Published var destination:String = ""
    
    @Published var toggleRecursive:Bool    = true
    @Published var toggleUpdate:Bool       = true
    @Published var toggleCompress:Bool     = false
    @Published var toggleProgress:Bool     = true
    @Published var togglePermissions:Bool  = false
    @Published var toggleTimes:Bool        = true
    @Published var toggleGroup:Bool        = false
    @Published var toggleOwner:Bool        = false
    @Published var toggleReadable:Bool     = true
    @Published var toggleIgnoreErrors:Bool = true
    @Published var toggleStats:Bool        = true
    
    
    
    init() {
        
    }
    
    //MARK: - Core functions
    func run() {
        generateCommand()
        
        
        task.standardOutput = pipe
        task.arguments = ["-c", command]
        task.launchPath = "/bin/zsh"
        
        do {
            //try task.run()
        } catch is Any {
            consoleOutput += "\nError running task"
        }
        

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        consoleOutput = String(data: data, encoding: .utf8)!
        print(consoleOutput)
    }
    
    func generateCommand() {
        command = "rsync --verbose"
        
        if toggleRecursive {
            command += " --recursive"
        }
        
        if toggleUpdate {
            command += " --update"
        }
        
        if toggleCompress {
            command += " --compress"
        }
        
        if toggleProgress {
            command += " --partial --progress"
        }
        
        if togglePermissions {
            command += " --perms"
        }
        
        if toggleTimes {
            command += " --times"
        }
        
        if toggleGroup {
            command += " --group"
        }
        
        if toggleOwner {
            command += " --owner"
        }
        
        if toggleReadable {
            command += " --human-readable"
        }
        
        if toggleIgnoreErrors {
            command += " --ignore-errors"
        }
        
        if toggleStats {
            command += " --stats"
        }
        
        command += " '" + source + "'"
        command += " '" + destination + "'"
        
        print(command)
    }
    
    //MARK: - Getters and Setters
    
    func getConsoleOutput() -> String {
        return self.consoleOutput
    }
}
