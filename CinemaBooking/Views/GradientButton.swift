//
//  GradientButton.swift
//  CinemaBooking
//
//  Created by Yousef on 6/1/22.
//

import SwiftUI

struct GradientButton: View {
    
    let label: String
    let onTap: () -> Void
    
    init(label: String, onTap: @escaping () -> Void) {
        self.label = label
        self.onTap = onTap
    }
    
    var body: some View {
        Button(action: {
            onTap()
        }, label: {
            Text(label)
                .customFont(.headline)
                .padding(.vertical)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color.theme.red,
                            Color.theme.purple
                        ]),
                        startPoint: UnitPoint(x: 0.25, y: 0.5),
                        endPoint: UnitPoint(x: 0.75, y: 0.5)
                    )
                )
                .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(hex: "FF53C0"),
                                    Color(hex: "FF53C0").opacity(0)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing),
                            lineWidth: 2
                        )
                )
        })
        .padding(.horizontal, 32)
        .padding(.bottom)
    }
}


struct GradientButton_Previews: PreviewProvider {
    static var previews: some View {
        GradientButton(label: "Title") { }
    }
}
