//
//  HallContent.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import SwiftUI

struct HallSection: Identifiable {
    let id: Int
    let name: String
    let seatPrice: Double
    var rows: [HallRow]
    
}

struct HallRow: Identifiable {
    let id: Int
    let name: String
    let sectionId: Int
    var seats: [Seat]
}

enum SeatStatus: String, Identifiable, CaseIterable {
    case available
    case reserved
    case selected
    
    var id: String { rawValue }
    
    var color: Color {
        switch self {
        case .available: return Color.white
        case .reserved: return Color.theme.red
        case .selected: return Color.theme.green
        }
    }
}

struct Seat: Identifiable {
    let number: Int
    let sectionId: Int
    let sectionName: String
    let rowId: Int
    let rowName: String
    let status: SeatStatus
    
    var id: String {
        "\(sectionName),\(rowName),\(number)"
    }
    
    func setSelected(_ selected: Bool) -> Seat {
        Seat(number: number, sectionId: sectionId, sectionName: sectionName, rowId: rowId, rowName: rowName, status: selected ? .selected : .available)
    }
    
    func reserve() -> Seat {
        Seat(number: number, sectionId: sectionId, sectionName: sectionName, rowId: rowId, rowName: rowName, status: .reserved)
    }
    
}
