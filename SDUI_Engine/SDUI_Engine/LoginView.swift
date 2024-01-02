//
//  LoginView.swift
//  SDUI_Engine
//
//  Created by terminal on 29/11/23.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    var body: some View {
        VStack {
            TextField("username", text: $username)
                .padding()
                .background(Color.gray.opacity(0.03))
                .cornerRadius(8)
                .shadow(radius: 0.5)
            SecureField("password", text: $username)
                .padding()
                .background(Color.gray.opacity(0.03))
                .cornerRadius(8)
                .shadow(radius: 0.5)
        }.padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
