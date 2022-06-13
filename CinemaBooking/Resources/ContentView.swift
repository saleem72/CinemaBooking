//
//  ContentView.swift
//  CinemaBooking
//
//  Created by Yousef on 5/30/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var session: SessionManager = .init()
    var body: some View {
        MainTabScreen()
            .environmentObject(session)
            .onAppear(perform: getFonts)
    }
    
    func getFonts() {
        let families = UIFont.familyNames
        for family in families {
            let fonts = UIFont.fontNames(forFamilyName: family)
            for font in fonts {
                print(font)
            }
            print("----------------------------------------------")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
