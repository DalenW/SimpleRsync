//
//  Console.swift
//  Simple Rsync
//
//  Created by Dalen Ward on 7/21/20.
//  Copyright © 2020 m6securities. All rights reserved.
//

import SwiftUI

struct Console: View {
    var body: some View {
        return GeometryReader { geometry in
            ScrollView {
                Text("content")
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
