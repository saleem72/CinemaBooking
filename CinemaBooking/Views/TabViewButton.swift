//
//  TabViewButton.swift
//  CinemaBooking
//
//  Created by Yousef on 6/5/22.
//

import SwiftUI

struct TabViewButton: View {
    let item: TabViewItem
    @Binding var selectedTab: TabViewItem
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedTab = item
            }
        }, label: {
            content
        })
    }
}

extension TabViewButton {
    private var content: some View {
        ZStack {
            if selectedTab == item {
                ZStack {
                    ZStack {
                        Circle()
                            .fill(Color(hex: "3B1578"))
                        
                        BlurView(style: .systemUltraThinMaterialLight)
                        
                        Circle()
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color.theme.green,
                                        Color.theme.green.opacity(0),
                                        Color.theme.green.opacity(0)
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing),
                                lineWidth: 4
                        )
                        
                        
                        
                        
                        Image(item.imageName)
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                            .padding(10)
                            .matchedGeometryEffect(id: item.imageName, in: animation)
                    }
                    .mask(Circle())
                    .matchedGeometryEffect(id: "circle", in: animation)
                    
                    
                }
                .frame(width: 80, height: 80)
                .offset(y: -25)
                .compositingGroup()
                .shadow(color: Color.black.opacity(0.25), radius: 20, x: 0.0, y: 10)
            } else {
                Image(item.imageName)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(.white)
                    .padding(10)
                    .matchedGeometryEffect(id: item.imageName, in: animation)
            }
            
        }
    }
}


struct TabViewButton_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView(selectedTab: .constant(.home))
            .previewLayout(.sizeThatFits)
    }
}
