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
    @State private var times: [ShowTime] = ShowTimeProvider.allShows
    private var spacing: CGFloat = (UIScreen.main.bounds.width - 270) / 6
    @State private var selectedDay: Date?
    @State private var selectedTime: ShowTime
    
    init(selectedDate: Binding<Date>) {
        self._selectedDate = selectedDate
        let temp = ShowTimeProvider.allShows.first == nil ? ShowTime(hour: 11, minutes: 0) : ShowTimeProvider.allShows.first!
        
        _selectedTime = State(initialValue: temp)
    }
    
    var body: some View {
        
        VStack(spacing: 0) {
            selectDaySection
//                .background(Color.green)
            
            selectTimeSection
                .offset(y: -17)
            
//            VStack {
//                Text("Selected date: \(selectedDate.shortDate), \(selectedDate.shortTime)")
//            }
        }
        .frame(maxWidth: .infinity, alignment: .top)
        .onAppear {
            updateDate()
        }
        .onChange(of: selectedDay, perform: { _ in
            updateDate()
        })
        .onChange(of: selectedTime.hour, perform: { _ in
            updateDate()
        })
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
    
    func updateDate() {
        let day = selectedDay == nil ? Date() : selectedDay!
        
        selectedDate = day.setTime(hour: selectedTime.hour, minutes: selectedTime.minutes, seconds: 0)
            
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
            HorizontalDatePicker(selectedDate: .constant(Date()))
        }
        .background(Color(.secondarySystemBackground))
    }
}




