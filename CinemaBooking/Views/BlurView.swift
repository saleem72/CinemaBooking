//
//  BlurView.swift
//  CinemaBooking
//
//  Created by Yousef on 6/5/22.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    
    var style: UIBlurEffect.Style = .systemThinMaterial
    var alpha: CGFloat = 1
     
    func makeUIView(context: Context) -> some UIView {
        let effect = UIBlurEffect(style: style)
        let view = UIVisualEffectView(effect: effect)
        view.alpha = alpha
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView()
    }
}
