//
//  View+Extension.swift
//  CoreDataTutorial
//
//  Created by Yousef on 5/22/22.
//

import SwiftUI

extension View {
    func greedyView(alignment: Alignment = .center) -> some View {
        frame(maxWidth: .infinity, maxHeight: .infinity, alignment: alignment)
    }
    
    var safeArea: UIEdgeInsets {
        (UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.safeAreaInsets ?? .zero)
    }
}
