//
//  MainTabScreen.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import SwiftUI



struct MainTabScreen: View {
    
    @State private var selectedTab: TabViewItem = .home
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                backgroundLayer
                
                Group {
                    switch selectedTab {
                    case .home: HomeScreen()
                    case .loaction: Text("location")
                    case .ticket: TicketsListScreen()
                    case .category: Text("Category")
                    case .profile: Text("Profile")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)

                AppTabView(selectedTab: $selectedTab)
            }
            .foregroundColor(.white)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    
}

extension MainTabScreen {
    private var backgroundLayer: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color.theme.blue,
                Color.theme.background
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainTabScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainTabScreen()
            .environmentObject(SessionManager())
    }
}



