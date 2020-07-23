//
//  Console.swift
//  Simple Rsync
//
//  Created by Dalen Ward on 7/21/20.
//  Copyright © 2020 m6securities. All rights reserved.
//

import SwiftUI

class Helper: ObservableObject {
    @Published var consoleText: String = ""
    
    init() {
        update(text: "Empty")
    }
    
    func update(text:String) {
        self.consoleText = text
        print("Updated the text")
    }
}

struct Console: View {
    @ObservedObject var helper:Helper = Helper()
    var body: some View {
        return GeometryReader { geometry in
            ScrollView {
                Text(self.helper.consoleText)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .padding(.leading, 5.0)
                    .frame(width: geometry.size.width)
                    .colorScheme(/*@START_MENU_TOKEN@*/.light/*@END_MENU_TOKEN@*/)
            }
            .background(Color.gray)
        }
    }
}

struct Console_Previews: PreviewProvider {
    static var previews: some View {
        Console()
    }
}
