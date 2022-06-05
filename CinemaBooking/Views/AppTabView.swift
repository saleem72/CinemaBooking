//
//  AppTabView.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import SwiftUI

struct AppTabView: View {
    
    @Binding var selectedTab: TabViewItem
    @Namespace var animation
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                Spacer(minLength: 0)
                ForEach(TabViewItem.allCases) { item in
                    TabViewButton(item: item, selectedTab: $selectedTab, animation: animation)
                    Spacer(minLength: 0)
                }
            }
            .frame(height: 90 - safeArea.bottom)
            .frame(maxWidth: .infinity)
            .background(
                auroraBk
            )
            .background(
                BlurView(style: .systemUltraThinMaterialLight)
                    .edgesIgnoringSafeArea(.bottom)
            )
            .background(
                Rectangle()
                .strokeBorder(LinearGradient(
                        gradient: Gradient(stops: [
                    .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.30000001192092896)), location: 0),
                    .init(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)), location: 1)]),
                        startPoint: UnitPoint(x: 0.48205124656653137, y: 6.49752817521998e-9),
                        endPoint: UnitPoint(x: 0.48717948843917747, y: 0.7444444124055332)), lineWidth: 1)
            )
        }
    }
}

extension AppTabView {
    private var auroraBk: some View {
        ZStack { // FF53C0
            
             EllipseShape()
                .fill(Color(hex: "3B1578"))
                .frame(width: 200, height: 231)
                .offset(x: -UIScreen.main.bounds.width / 2 + 20, y: 20)
                .blur(radius: 100)
//
             EllipseShape()
                .fill(Color(hex: "3B1578"))
                .frame(width: 200, height: 231)
                .offset(y: 108)
                .blur(radius: 100)

             EllipseShape()
                .fill(Color(hex: "FF53C0"))
                .frame(width: 200, height: 231)
                .offset(x: UIScreen.main.bounds.width / 2 - 40, y: 120)
                .blur(radius: 130)
            
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.theme.blue,
                    Color.theme.background
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
                
            
            VStack {
                Spacer()
                AppTabView(selectedTab: .constant(.home))
            }
        }
    }
}

