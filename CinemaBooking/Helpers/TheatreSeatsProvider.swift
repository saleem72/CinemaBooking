//
//  TheatreSeatsProvider.swift
//  CinemaBooking
//
//  Created by Yousef on 6/2/22.
//

import Foundation

final class TheatreSeatsProvider {
    
    private func getVipEastSectionSeats() -> TheatreSection {
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
        
        
        let vipEastFirstRow = TheatreRow(id: 1, name: "A", sectionId: 1, seats: vipEastFirstRowSeats)
        let vipEastSecondRow = TheatreRow(id: 2, name: "B", sectionId: 1, seats: vipEastSecondRowSeats)
        return TheatreSection(id: 1, name: "Vip east", seatPrice: 20, rows: [vipEastFirstRow, vipEastSecondRow])
    }
    
    private func getVipWestSectionSeats() -> TheatreSection {
        let vipWestFirstRowSeats: [Seat] = [
            .init(number: 1, sectionId: 2, sectionName: "VIP west", rowId: 3, rowName: "A", status: .available),
            .init(number: 2, sectionId: 2, sectionName: "VIP west", rowId: 3, rowName: "A", status: .reserved),
            .init(number: 3, sectionId: 2, sectionName: "VIP west", rowId: 3, rowName: "A", status: .available)
        ]
        let vipWestFirstRow = TheatreRow(id: 3, name: "A", sectionId: 1, seats: vipWestFirstRowSeats)
        
        let vipWestSecondRowSeats: [Seat] = [
            .init(number: 1, sectionId: 2, sectionName: "VIP west", rowId: 4, rowName: "B", status: .available),
            .init(number: 2, sectionId: 2, sectionName: "VIP west", rowId: 4, rowName: "B", status: .available),
            .init(number: 3, sectionId: 2, sectionName: "VIP west", rowId: 4, rowName: "B", status: .available),
            .init(number: 4, sectionId: 2, sectionName: "VIP west", rowId: 4, rowName: "B", status: .available)
        ]
        
        let vipWestSecondRow = TheatreRow(id: 4, name: "B", sectionId: 1, seats: vipWestSecondRowSeats)
        
        
        
        return TheatreSection(id: 2, name: "Vip west", seatPrice: 18, rows: [vipWestFirstRow, vipWestSecondRow])
    }
    
    private func getThirdSection() -> TheatreSection {
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
        
        let thirdSectionRow = TheatreRow(id: 5, name: "C", sectionId: 3, seats: thirdSectionRowSeats)
        
        
        
        return TheatreSection(id: 3, name: "Midel", seatPrice: 12, rows: [thirdSectionRow])
    }
    
    private func getForthSection() -> TheatreSection {
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
        
        let forthSectionFirstRow = TheatreRow(id: 6, name: "D", sectionId: 4, seats: forthSectionFirstRowSeats)
        
        
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
        
        let forthSectionSecondRow = TheatreRow(id: 7, name: "E", sectionId: 4, seats: forthSectionSecondRowSeats)
        
        
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
        
        let forthSectionThirdRow = TheatreRow(id: 8, name: "F", sectionId: 4, seats: forthSectionThirdRowSeats)
        
        
        
        return TheatreSection(id: 4, name: "Last", seatPrice: 8, rows: [forthSectionFirstRow, forthSectionSecondRow, forthSectionThirdRow])
    }
    
    func dummyData() -> [TheatreSection] {
        
        let vipEastSection = getVipEastSectionSeats()
        
        let vipWestSection = getVipWestSectionSeats()
        
        let thirdSection = getThirdSection()
        let forthSection = getForthSection()
        
        return [vipEastSection, vipWestSection, thirdSection, forthSection]
    }
    
    func getTheatre() -> [TheatreSection] {
        let result = Bundle.main.ObjectFromJson(type: [TheatreSection].self, fileName: "Theatre.json")
        switch result {
        case .success(let sections):
            return sections
        case .failure(let error):
            print(error.localizedDescription)
            return []
        }
    }
}
