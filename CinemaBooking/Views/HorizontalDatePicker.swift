//
//  HorizontalDatePicker.swift
//  CinemaBooking
//
//  Created by Yousef on 5/31/22.
//

import SwiftUI



struct HorizontalDatePicker: View {
//    @Binding var selectedDate: Date
    @State private var dates: [Date] = Date().weekFromNow
    @State private var times: [ShowTime] = ShowTimeProvider.allShows
    private var spacing: CGFloat = (UIScreen.main.bounds.width - 270) / 6
    @Binding private var selectedDay: Date
    @Binding private var selectedTime: ShowTime
    
    init(selectedDay: Binding<Date>, selectedTime: Binding<ShowTime>) {
        self._selectedDay = selectedDay
        self._selectedTime = selectedTime
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            selectDaySection
            
            selectTimeSection
                .offset(y: -17)
        }
        .frame(maxWidth: .infinity, alignment: .top)
    }
    
    func getOffset(for idx: Int) -> CGFloat {
        if idx == 2 {
            return -35
        } else if idx == 1 || idx == 3 {
            return -20
        } else {
            return 0
        }
    }
}

extension HorizontalDatePicker {
    
    private var selectTimeSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: spacing) {
                Spacer()
                    .frame(width: (UIScreen.main.bounds.width / 2) - 20 - 35)
                ForEach(times) { time in
                    SmallSizeDateCard(time: time, selectedTime: $selectedTime)
                }
                Spacer()
                    .frame(width: (UIScreen.main.bounds.width / 2) - 20 - 35)
            }
            .frame(maxWidth: .infinity, alignment: .top)
            .padding(.top, 35)
        }
        .background(Color.clear)
    }
    
    private var selectDaySection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .bottom, spacing: spacing) {
                
                Spacer()
                    .frame(width: (UIScreen.main.bounds.width / 2) - 20 - 35)
                
                ForEach(dates, id:\.self) { date in
                    FullSizeDateCard(date: date, selectedDay: $selectedDay)
                        .frame(height: 132, alignment: .top)
                }
                
                Spacer()
                    .frame(width: (UIScreen.main.bounds.width / 2) - 20 - 35)
            }
        }
        .background(Color.clear)
    }
}

struct HorizontalDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HorizontalDatePicker(selectedDay: .constant(Date()), selectedTime: .constant(ShowTime(hour: 16, minutes: 00)))
        }
        .background(Color(.secondarySystemBackground))
    }
}




