//
//  Modifiers.swift
//  Top8
//
//  Created by Antonio Rodriguez Cia on 02/07/2020.
//  Copyright © 2020 Goojoob. All rights reserved.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 12)
            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}


struct FontModifier: ViewModifier {
    var style: Font.TextStyle
    
    func body(content: Content) -> some View {
        content
            .font(.system(style, design: .serif))
    }
}

struct CustomFontModifier: ViewModifier {
    var size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Barlow-Medium", size: size))
    }
}

