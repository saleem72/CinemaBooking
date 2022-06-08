//
//  ShowTime.swift
//  CinemaBooking
//
//  Created by Yousef on 6/1/22.
//

import Foundation

struct ShowTime: Identifiable, Equatable, Codable {
    
    let id: Int
    let hour: Int
    let minutes: Int
    
    var value: String {
        "\(String(format: "%02d", hour)):\(String(format: "%02d", minutes))"
    }
    
    var label: String {
        if hour == 12 {
            return "12:\(String(format: "%02d", minutes)) p.m."
        } else if hour > 12 {
            return "\(hour - 12):\(String(format: "%02d", minutes)) p.m."
        } else {
            return "\(String(format: "%02d", hour)):\(String(format: "%02d", minutes)) p.m."
        }
    }
    
    static func ==(lhs: ShowTime, rhs: ShowTime) -> Bool {
        lhs.hour == rhs.hour && lhs.minutes == rhs.minutes
    }
    
    static let example: ShowTime = .init(
        id: 1, hour: 16, minutes: 0
    )
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
        .init(id: 1, hour: 16, minutes: 0),
        .init(id: 2, hour: 17, minutes: 0),
        .init(id: 3, hour: 18, minutes: 0),
        .init(id: 4, hour: 19, minutes: 0),
        .init(id: 5, hour: 20, minutes: 0)
    ]
}
