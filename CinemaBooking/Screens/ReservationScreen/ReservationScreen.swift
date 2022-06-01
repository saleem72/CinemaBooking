//
//  ReservationScreen.swift
//  CinemaBooking
//
//  Created by Yousef on 5/30/22.
//

import SwiftUI

struct ReservationScreen: View {
    @State private var selectedDate = Date()
    var body: some View {
        ZStack {
            
            Color.theme.background
                .edgesIgnoringSafeArea(.all)
            
            Image(Asset.man)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.top)
                .frame(maxHeight: .infinity, alignment: .top)
            
            VStack {
                header
                
                Spacer()
                
                VStack(spacing: 30) {
                    VStack {
                        Text("Doctor Strange")
                            .customFont(.title3)
                        Text("in the Multiverse of Madness")
                            .customFont()
                    }
                    
                    Text("Dr. Stephen Strange casts a forbidden spell that opens the doorway to the multiverse, including alternate versions of...")
                        .customFont()
                    
                    Text("Select date and time")
                        .customFont(.headline)
                    
                    
                    
                    
                }
                .padding(.horizontal, 32)
                .multilineTextAlignment(.center)
                
                
                HorizontalDatePicker(selectedDate: $selectedDate)
                    .frame(height: 220)
                
                Button(action: {}, label: {
                    Text("Reservation")
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
            .foregroundColor(Color.white.opacity(0.87))
        }
    }
}

extension ReservationScreen {
    private var header: some View {
        HStack {
            Button(action: {}, label: {
                Image(systemName: "arrow.backward")
                    .headerButton()
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(Asset.menu)
                    .headerButton()
            })
        }
        .padding()
    }
}

struct ReservationScreen_Previews: PreviewProvider {
    static var previews: some View {
        ReservationScreen()
    }
}
