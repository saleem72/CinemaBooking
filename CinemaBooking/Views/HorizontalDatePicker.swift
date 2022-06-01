//
//  HorizontalDatePicker.swift
//  CinemaBooking
//
//  Created by Yousef on 5/31/22.
//

import SwiftUI

struct HorizontalDatePicker: View {
    @Binding var selectedDate: Date
    @State private var dates: [Date] = Date().weekFromNow
    private var spacing: CGFloat = (UIScreen.main.bounds.width - 270) / 6
    
    init(selectedDate: Binding<Date>) {
        self._selectedDate = selectedDate
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: spacing) {
                    
                    Spacer()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 20 - 35)
                    
                    ForEach(dates, id:\.self) { date in
                        FullSizeDateCard(date: date)
                            .frame(height: 140, alignment: .top)
                    }
                    
                    Spacer()
                        .frame(width: (UIScreen.main.bounds.width / 2) - 20 - 35)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//        .overlay(grid)
        
    }
}

extension HorizontalDatePicker {
    private var grid: some View {
        HStack {
            Spacer()
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 2)
            }
            
                Spacer()
            ZStack {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 2)
                
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 2)
                    .offset(x: 35 + 20 + 50 + 20)
                
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 2)
                    .offset(x: -(35 + 20 + 50 + 20))
            }
            
                Spacer()
            Rectangle()
                .fill(Color.blue)
                .frame(width: 2)
            
                Spacer()
        }
    }
}

struct HorizontalDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HorizontalDatePicker(selectedDate: .constant(Date()))
        }
        .frame(height: 220)
        .background(Color(.secondarySystemBackground))
    }
}


