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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
