//
//  FullSizeDateCard.swift
//  CinemaBooking
//
//  Created by Yousef on 5/31/22.
//

import SwiftUI

struct FullSizeDateCard: View {
    var date: Date
    @Binding var selectedDay: Date
    
    @State private var isFull: Bool = true
    @State private var expand: CGFloat = 0
    @State private var offset: CGFloat = 0
    
    var body: some View {
        dateSectionBackground
            .overlay(dateLabel)
            .foregroundColor(.white)
            .frame(width: 50 + expand, height: 80 + expand)
            .background(dragingControl)
            .offset(y: -offset)
    }
}

extension FullSizeDateCard {
    
    
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
                    selectedDay = date
                } else {
                    expand = 0
                    isFull = false
                }
                
                // Conntrol Cell offfset
                let offsetArea: CGFloat = (35 + 20 + 50 + 20 + 50)
                if rect.maxX < (screeenCenter  + offsetArea) && rect.minX > (screeenCenter - offsetArea) {
                    let temp = (screeenCenter - rect.midX) / offsetArea
                    offset =  -max(0, min(abs(temp) * 60 , 60))
                }
            }
            return Color.clear
        }
    }
    
    private var dateSectionBackground: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(isFull ? Gradients.fullSizeCardBackground : Gradients.smallSizeCardBackground)
            
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .strokeBorder(isFull ? Gradients.fullSizeCardStroke : Gradients.smallSizeCardStroke, lineWidth: 2)
        }
        .frame(maxHeight: .infinity)
    }
    
    private var dateLabel: some View {
        VStack {
            Text(date.weekday)
                .customFont()
            
            Text("\(date.day)")
                .fontWeight(.bold)
                .customFont()
                
        }
    }
    
    private var timeSectionBackground: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Gradients.smallSizeCardBackground)
            
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Gradients.smallSizeCardStroke, lineWidth: 2)
        }
        .frame(height: 40)
    }
    
    private var timeLabel: some View {
        Text(date.shortTime)
            .customFont()
            .minimumScaleFactor(0.6)
    }
}

