//
//  ContentView.swift
//  SDUI_Engine
//
//  Created by terminal on 11/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                SDUIView(viewModel: .init(to: ""))
            } label: {
                Text("SDUIView")
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}

