//
//  SDUIView.swift
//  SDUI_Engine
//
//  Created by terminal on 16/11/23.
//

import SwiftUI

struct SDUIView: View, UIDelegate {
    @ObservedObject var viewModel: SDUIViewModel
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                if !viewModel.didAppear {
                    Spacer()
                    ProgressView()
                    Spacer()
                }
                ForEach(viewModel.components, id: \.uid) { component in
                    component.renderUI(delegate: self)
                }
            }
        }
        .padding(.horizontal)
        .refreshable {
            self.viewModel.onRefresh()
        }
        .onAppear(perform: {
            self.viewModel.onAppear()
        })
        .onDisappear(perform: {
            self.viewModel.onDissapear()
        })
        .navigationTitle($viewModel.title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            VStack {
                ForEach(viewModel.navigationBarComponent, id: \.uid) { component in
                    component.renderUI(delegate: self)
                }
            }
        }
    }
    
    func handleButtonEvent(uid: String) {
        if uid == "sign_in_btn" {
            let unamec = self.viewModel.components.first { c in
                c.uid == "username"
            }
            guard let uname = unamec as? TextfieldComponent else {
                return
            }
            let pwdc = self.viewModel.components.first { c in
                c.uid == "password"
            }
            guard let pwd = pwdc as? TextfieldComponent else {
                return
            }
            print("username",uname.getValue())
            print("password",pwd.getValue())
            return
        }
        print("hello world! from", uid)
    }
}

//struct SDUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SDUIView()
//    }
//}
