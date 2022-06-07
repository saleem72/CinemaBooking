//
//  AppTextField.swift
//  CinemaBooking
//
//  Created by Yousef on 6/7/22.
//

import SwiftUI

struct AppTextField: View {
    
    @Binding var searchTerm: String
    
    var body: some View {
        TextField("", text: $searchTerm)
            .customFont(.headline)
            .padding(.horizontal, 32)
            .overlay(
                Image(systemName: "magnifyingglass"), alignment: .leading
            )
            .overlay(
                Image(systemName: "mic.fill"), alignment: .trailing
            )
            .background(placeHolder(), alignment: .leading)
            .frame(height: 36)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(hex: "767680").opacity(0.12))
            )
            .padding(.horizontal)
    }
    
    @ViewBuilder
    private func placeHolder() -> some View {
        if searchTerm.isEmpty {
            Text("Search")
                .padding(.leading, 32)
                .allowsTightening(false)
        }
    }
}
