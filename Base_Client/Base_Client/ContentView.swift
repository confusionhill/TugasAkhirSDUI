//
//  ContentView.swift
//  Base_Client
//
//  Created by terminal on 10/01/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                ListView()
            } label: {
                Text("SDUIView")
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
