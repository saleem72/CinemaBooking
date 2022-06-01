//
//  HeaderButtonModifire.swift
//  CinemaBooking
//
//  Created by Yousef on 5/30/22.
//

import SwiftUI

struct HeaderButtonModifire: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 44, height: 44)
            .background(Color.white.opacity(0.3).blur(radius: 4))
            
            .mask(Circle())
            .background(
                Circle()
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.theme.green,
                                Color.theme.green.opacity(0),
                                Color.theme.green.opacity(0)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                    )
            )
    }
}

extension View {
    func headerButton() -> some View {
        modifier(HeaderButtonModifire())
    }
}
