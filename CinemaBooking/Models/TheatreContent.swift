//
//  TheatreContent.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import SwiftUI

struct TheatreSection: Identifiable, Codable {
    let id: Int
    let name: String
    let seatPrice: Double
    var rows: [TheatreRow]
    
}

struct TheatreRow: Identifiable, Codable {
    let id: Int
    let name: String
    let sectionId: Int
    var seats: [Seat]
}

enum SeatStatus: String, Identifiable, CaseIterable, Codable {
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

struct Seat: Identifiable, Codable {
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
    
    static let dummyData: [Seat] = [
        .init(number: 1, sectionId: 1, sectionName: "VIP", rowId: 1, rowName: "A", status: .available),
        .init(number: 2, sectionId: 1, sectionName: "VIP", rowId: 1, rowName: "A", status: .available)
    ]
    
}
