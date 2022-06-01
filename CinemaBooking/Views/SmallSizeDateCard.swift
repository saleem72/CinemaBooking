//
//  SmallSizeDateCard.swift
//  CinemaBooking
//
//  Created by Yousef on 6/1/22.
//

import SwiftUI

struct SmallSizeDateCard: View {
    let time: ShowTime
    @Binding var selectedTime: ShowTime
    
    @State private var isFull: Bool = true
    @State private var expand: CGFloat = 0
    @State private var offset: CGFloat = 0
    
    var body: some View {
        timeSectionBackground
            .overlay(timeLabel)
            .background(dragingControl)
            
            .frame(height: 40)
            .frame(width: 50 + expand)
            .offset(y: -offset)
    }
}

extension SmallSizeDateCard {
    
    private var dragingControl: some View {
        GeometryReader { goe -> Color in
            let screeenCenter = UIScreen.main.bounds.width / 2
            DispatchQueue.main.async {
                let rect = goe.frame(in: .global)
                
                // Control cell Size
                let sizingArea: CGFloat = 55
                if rect.maxX < (screeenCenter + sizingArea) &&
                    rect.minX > (screeenCenter - sizingArea) {
                    let temp = abs((screeenCenter - rect.midX) / 20)
//                    if temp > 0.7 {
//                        temp = 1
//                    }
                    expand = 20 -  max(0, min(temp * 20 , 20))
                    isFull = true
                    selectedTime = time
                } else {
                    expand = 0
                    isFull = false
                }
                
                // Conntrol Cell offfset
                let offsetArea: CGFloat = (35 + 20 + 50 + 20 + 50)
                if rect.maxX < (screeenCenter  + offsetArea) && rect.minX > (screeenCenter - offsetArea) {
                    let temp =  1 - abs((screeenCenter - rect.midX) / offsetArea)
                    offset =  max(0, min(abs(temp) * 35 , 35))
                }
            }
            return Color.clear
        }
    }
    
    private var timeSectionBackground: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(isFull ? Gradients.fullSizeCardBackground : Gradients.smallSizeCardBackground)
            
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(isFull ? Gradients.fullSizeCardStroke : Gradients.smallSizeCardStroke, lineWidth: 2)
        }
    }
    
    private var timeLabel: some View {
        Text(time.label)
            .customFont()
            .minimumScaleFactor(0.6)
            .foregroundColor(.white)
    }
}
