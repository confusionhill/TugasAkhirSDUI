//
//  ImageComponent.swift
//  SDUI_Engine
//
//  Created by terminal on 11/11/23.
//

import SwiftUI

struct CircularImageComponent: UIComponent {
    var children: [UIComponent] = []
    
    var child: UIComponent? = nil
    
    var uid: String
    var size: CGFloat
    
    func renderUI(delegate: UIDelegate) -> AnyView {
        return ImageView()
            .clipShape(Circle())
            .frame(width: self.size, height: self.size)
            .toAny()
    }
}

struct ImageView: View {
    var body: some View {
        AsyncImage(
            url: URL(string: "https://pbs.twimg.com/profile_images/1719332600983228416/2n_7pjdN_400x400.jpg")
        ) { img in
            img.resizable()
        } placeholder: {
            ProgressView()
        }
    }
}
