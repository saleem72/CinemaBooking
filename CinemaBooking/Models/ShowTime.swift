//
//  ShowTime.swift
//  CinemaBooking
//
//  Created by Yousef on 6/1/22.
//

import Foundation

struct ShowTime: Identifiable, Equatable {
    
    let id = UUID()
    let hour: Int
    let minutes: Int
    
    var label: String {
        "\(hour):\(minutes)"
    }
    
    static func ==(lhs: ShowTime, rhs: ShowTime) -> Bool {
        lhs.hour == rhs.hour && lhs.minutes == rhs.minutes
    }
}

enum ShowTimeProvider {
    /*
     case sixteen = "16:00"
         case seventeen = "17:00"
         case eighteen = "18:00"
         case nineteen = "19:00"
         case twenty = "20:00"
     */
    static var allShows: [ShowTime] = [
        .init(hour: 16, minutes: 0),
        .init(hour: 17, minutes: 0),
        .init(hour: 18, minutes: 0),
        .init(hour: 19, minutes: 0),
        .init(hour: 20, minutes: 0)
    ]
}
