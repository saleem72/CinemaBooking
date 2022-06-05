//
//  TabViewItem.swift
//  CinemaBooking
//
//  Created by Yousef on 6/5/22.
//

import Foundation

enum TabViewItem: Int, Identifiable, CaseIterable {
    case home
    case loaction
    case ticket
    case category
    case profile
    
    var id: Int { rawValue }
    
    var imageName: String {
        switch self {
        case .home: return Asset.home
        case .loaction: return Asset.location
        case .ticket: return Asset.ticket
        case .category: return Asset.category
        case .profile: return Asset.profile
        }
    }
}
