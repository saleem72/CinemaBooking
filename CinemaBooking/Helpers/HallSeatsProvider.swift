//
//  HallSeatsProvider.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import Foundation

enum HallSeatsProvider {
    
    private static func getVipEastSectionSeats() -> HallSection {
        let vipEastFirstRowSeats: [Seat] = [
            .init(number: 1, sectionId: 1, sectionName: "VIP east", rowId: 1, rowName: "A", status: .reserved),
            .init(number: 2, sectionId: 1, sectionName: "VIP east", rowId: 1, rowName: "A", status: .available),
            .init(number: 3, sectionId: 1, sectionName: "VIP east", rowId: 1, rowName: "A", status: .available)
        ]
        
        let vipEastSecondRowSeats: [Seat] = [
            .init(number: 1, sectionId: 1, sectionName: "VIP east", rowId: 2, rowName: "B", status: .available),
            .init(number: 2, sectionId: 1, sectionName: "VIP east", rowId: 2, rowName: "B", status: .available),
            .init(number: 3, sectionId: 1, sectionName: "VIP east", rowId: 2, rowName: "B", status: .reserved),
            .init(number: 4, sectionId: 1, sectionName: "VIP east", rowId: 2, rowName: "B", status: .available)
        ]
        
        
        let vipEastFirstRow = HallRow(id: 1, name: "A", sectionId: 1, seats: vipEastFirstRowSeats)
        let vipEastSecondRow = HallRow(id: 2, name: "B", sectionId: 1, seats: vipEastSecondRowSeats)
        return HallSection(id: 1, name: "Vip east", seatPrice: 20, rows: [vipEastFirstRow, vipEastSecondRow])
    }
    
    private static func getVipWestSectionSeats() -> HallSection {
        let vipWestFirstRowSeats: [Seat] = [
            .init(number: 1, sectionId: 2, sectionName: "VIP west", rowId: 3, rowName: "A", status: .available),
            .init(number: 2, sectionId: 2, sectionName: "VIP west", rowId: 3, rowName: "A", status: .reserved),
            .init(number: 3, sectionId: 2, sectionName: "VIP west", rowId: 3, rowName: "A", status: .available)
        ]
        let vipWestFirstRow = HallRow(id: 3, name: "A", sectionId: 1, seats: vipWestFirstRowSeats)
        
        let vipWestSecondRowSeats: [Seat] = [
            .init(number: 1, sectionId: 2, sectionName: "VIP west", rowId: 4, rowName: "B", status: .available),
            .init(number: 2, sectionId: 2, sectionName: "VIP west", rowId: 4, rowName: "B", status: .available),
            .init(number: 3, sectionId: 2, sectionName: "VIP west", rowId: 4, rowName: "B", status: .available),
            .init(number: 4, sectionId: 2, sectionName: "VIP west", rowId: 4, rowName: "B", status: .available)
        ]
        
        let vipWestSecondRow = HallRow(id: 4, name: "B", sectionId: 1, seats: vipWestSecondRowSeats)
        
        
        
        return HallSection(id: 2, name: "Vip west", seatPrice: 18, rows: [vipWestFirstRow, vipWestSecondRow])
    }
    
    private static func getThirdSection() -> HallSection {
        let thirdSectionRowSeats: [Seat] = [
            .init(number: 1, sectionId: 3, sectionName: "Midel", rowId: 5, rowName: "C", status: .available),
            .init(number: 2, sectionId: 3, sectionName: "Midel", rowId: 5, rowName: "C", status: .reserved),
            .init(number: 3, sectionId: 3, sectionName: "Midel", rowId: 5, rowName: "C", status: .available),
            .init(number: 4, sectionId: 3, sectionName: "Midel", rowId: 5, rowName: "C", status: .available),
            .init(number: 5, sectionId: 3, sectionName: "Midel", rowId: 5, rowName: "C", status: .available),
            .init(number: 6, sectionId: 3, sectionName: "Midel", rowId: 5, rowName: "C", status: .available),
            .init(number: 7, sectionId: 3, sectionName: "Midel", rowId: 5, rowName: "C", status: .available),
            .init(number: 8, sectionId: 3, sectionName: "Midel", rowId: 5, rowName: "C", status: .available)
        ]
        
        let thirdSectionRow = HallRow(id: 5, name: "C", sectionId: 3, seats: thirdSectionRowSeats)
        
        
        
        return HallSection(id: 3, name: "Midel", seatPrice: 12, rows: [thirdSectionRow])
    }
    
    private static func getForthSection() -> HallSection {
        let forthSectionFirstRowSeats: [Seat] = [
            .init(number: 1, sectionId: 4, sectionName: "Last", rowId: 6, rowName: "D", status: .available),
            .init(number: 2, sectionId: 4, sectionName: "Last", rowId: 6, rowName: "D", status: .available),
            .init(number: 3, sectionId: 4, sectionName: "Last", rowId: 6, rowName: "D", status: .available),
            .init(number: 4, sectionId: 4, sectionName: "Last", rowId: 6, rowName: "D", status: .available),
            .init(number: 5, sectionId: 4, sectionName: "Last", rowId: 6, rowName: "D", status: .available),
            .init(number: 6, sectionId: 4, sectionName: "Last", rowId: 6, rowName: "D", status: .reserved),
            .init(number: 7, sectionId: 4, sectionName: "Last", rowId: 6, rowName: "D", status: .available),
            .init(number: 8, sectionId: 4, sectionName: "Last", rowId: 6, rowName: "D", status: .available),
            .init(number: 9, sectionId: 4, sectionName: "Last", rowId: 6, rowName: "D", status: .available)
        ]
        
        let forthSectionFirstRow = HallRow(id: 6, name: "D", sectionId: 4, seats: forthSectionFirstRowSeats)
        
        
        let forthSectionSecondRowSeats: [Seat] = [
            .init(number: 1, sectionId: 4, sectionName: "Last", rowId: 7, rowName: "E", status: .available),
            .init(number: 2, sectionId: 4, sectionName: "Last", rowId: 7, rowName: "E", status: .available),
            .init(number: 3, sectionId: 4, sectionName: "Last", rowId: 7, rowName: "E", status: .available),
            .init(number: 4, sectionId: 4, sectionName: "Last", rowId: 7, rowName: "E", status: .available),
            .init(number: 5, sectionId: 4, sectionName: "Last", rowId: 7, rowName: "E", status: .available),
            .init(number: 6, sectionId: 4, sectionName: "Last", rowId: 7, rowName: "E", status: .available),
            .init(number: 7, sectionId: 4, sectionName: "Last", rowId: 7, rowName: "E", status: .available),
            .init(number: 8, sectionId: 4, sectionName: "Last", rowId: 7, rowName: "E", status: .available),
            .init(number: 9, sectionId: 4, sectionName: "Last", rowId: 7, rowName: "E", status: .reserved)
        ]
        
        let forthSectionSecondRow = HallRow(id: 7, name: "E", sectionId: 4, seats: forthSectionSecondRowSeats)
        
        
        let forthSectionThirdRowSeats: [Seat] = [
            .init(number: 1, sectionId: 4, sectionName: "Last", rowId: 8, rowName: "F", status: .available),
            .init(number: 2, sectionId: 4, sectionName: "Last", rowId: 8, rowName: "F", status: .available),
            .init(number: 3, sectionId: 4, sectionName: "Last", rowId: 8, rowName: "F", status: .available),
            .init(number: 4, sectionId: 4, sectionName: "Last", rowId: 8, rowName: "F", status: .reserved),
            .init(number: 5, sectionId: 4, sectionName: "Last", rowId: 8, rowName: "F", status: .available),
            .init(number: 6, sectionId: 4, sectionName: "Last", rowId: 8, rowName: "F", status: .available),
            .init(number: 7, sectionId: 4, sectionName: "Last", rowId: 8, rowName: "F", status: .available),
            .init(number: 8, sectionId: 4, sectionName: "Last", rowId: 8, rowName: "F", status: .available),
            .init(number: 9, sectionId: 4, sectionName: "Last", rowId: 8, rowName: "F", status: .available)
        ]
        
        let forthSectionThirdRow = HallRow(id: 8, name: "F", sectionId: 4, seats: forthSectionThirdRowSeats)
        
        
        
        return HallSection(id: 4, name: "Last", seatPrice: 8, rows: [forthSectionFirstRow, forthSectionSecondRow, forthSectionThirdRow])
    }
    
    static func dummyData() -> [HallSection] {
        
        let vipEastSection = getVipEastSectionSeats()
        
        let vipWestSection = getVipWestSectionSeats()
        
        let thirdSection = getThirdSection()
        let forthSection = getForthSection()
        
        return [vipEastSection, vipWestSection, thirdSection, forthSection]
    }
}
