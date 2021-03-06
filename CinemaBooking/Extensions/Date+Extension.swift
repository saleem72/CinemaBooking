//
//  Date+Extension.swift
//  PlaygroundForTesting
//
//  Created by Yousef on 7/20/21.
//

import Foundation

fileprivate class DateManager {
    private var formatter = DateFormatter()
    
    init() {
        print("DateManager class has initialized")
    }
   
    func month(from date: Date) -> String {
        formatter.dateFormat = "LLLL"
        return formatter.string(from: date)
    }
    
    func day(from date: Date) -> String {
        formatter.dateFormat = "eee"
        return formatter.string(from: date)
    }
    
    func longDate(_ date: Date) -> String {
        formatter.dateStyle = .long
        
        return formatter.string(from: date)
    }
    
    func mediumDate(_ date: Date) -> String {
        formatter.dateFormat = "LLLL dd"
        
        return formatter.string(from: date)
    }
    
    func shortDate(_ date: Date) -> String {
        formatter.dateFormat = "dd/MMM"
        
        return formatter.string(from: date)
    }
    
    func custom(_ date: Date) -> String {
        formatter.dateFormat = "dd/ MMM /yyyy"
        return formatter.string(from: date)
    }
    
    func from(_ str: String) -> Date {
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter.date(from: str) ?? Date()
    }
    
    func shortTime(_ date: Date) -> String {
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    func mediumTime(_ date: Date) -> String {
        formatter.dateFormat = "hh:mm:ss"
        return formatter.string(from: date)
    }
    
    func dateFormatter() -> DateFormatter {
        return formatter
    }
    
    func dateTime(_ date: Date) -> String {
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return formatter.string(from: date)
    }
    
    func fromDateTime(_ str: String) -> Date {
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        
        return formatter.date(from: str) ?? Date.init(timeIntervalSince1970: 0)
    }
}

extension Date {
    
    static fileprivate var dateManager: DateManager = .init()
    
    func equal(date: Date) -> Bool {
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: date)
        let selfComponents = Calendar.current.dateComponents([.year, .month, .day], from: self)
        return dateComponents == selfComponents
    }
    
    func setTime(hour: Int, minutes: Int, seconds: Int) -> Date {
        return Calendar.iso8601.date(bySettingHour: hour, minute: minutes, second: seconds, of: self)!
    }
    
    static func dateComponents(timeZone: TimeZone? = TimeZone(secondsFromGMT: 0), day: Int, month: Int, year: Int, hour: Int = 12, minutes: Int = 0, seconds: Int = 0) -> Date {
        let calendar = Calendar.current
        let components = DateComponents(timeZone: timeZone, year: year, month: month, day: day, hour: hour, minute: minutes, second: seconds)
        return calendar.date(from: components)!
    }
    
    var weekdayIndex: Int {
        let weekday = Calendar.current.component(.weekday, from: self)
        return weekday
    }
    
    var weekday: String {
        return Self.dateManager.day(from: self)
    }
    
    var day: Int {
        let day = Calendar.current.component(.day, from: self)
        return day
    }
    
    var month: String {
        return Self.dateManager.month(from: self)
    }
    
    var year: Int {
        let day = Calendar.current.component(.year, from: self)
        return day
    }
    
    var monthDays: Int {
        let range = Calendar.current.range(of: .day, in: .month, for: self)!
        return range.count
    }
    
    static var monthsList: [String] {
        var result = [String]()
        for i in 1...12 {
            let date = dateComponents(day: 1, month: i, year: 2000)
            result.append(Self.dateManager.month(from: date))
        }
        return result
    }
    
    var week: [Date] {
        let calendar = Calendar.current
        let week = calendar.dateInterval(of: .weekOfMonth, for: Date())
        
        guard let firstDay = week?.start  else { return [] }
        var result = [Date]()
        (0..<7).forEach { day in
            if let weekDay = calendar.date(byAdding: .day, value: day, to: firstDay) {
                result.append(weekDay)
            }
        }
        return result
    }
    
    var weekFromNow: [Date] {
        let calendar = Calendar.current
        
        var result = [Date]()
        (0..<7).forEach { day in
            if let weekDay = calendar.date(byAdding: .day, value: day, to: self) {
                result.append(weekDay)
            }
        }
        return result
    }
    
    var longDate: String {
        Self.dateManager.longDate(self)
    }
    
    var mediumDate: String {
        Self.dateManager.mediumDate(self)
    }
    
    var shortDate: String {
        Self.dateManager.shortDate(self)
    }
    
    var custom: String {
        Self.dateManager.custom(self)
    }
    
    func date(byAdding object : Calendar.Component, value: Int) -> Date {
        Calendar.iso8601.date(byAdding: object, value: value, to: self) ?? Date()
    }
    
    static func from(_ str: String) -> Date {
        Self.dateManager.from(str)
    }
    
    var shortTime: String {
        Self.dateManager.shortTime(self)
    }
    
    var mediumTime: String {
        Self.dateManager.mediumTime(self)
    }
    
    static func dateFormatter() -> DateFormatter {
        Self.dateManager.dateFormatter()
    }
    
    static func fromDateTime(_ str: String) -> Date {
        Self.dateManager.fromDateTime(str)
    }
    
    var dateTime: String {
        Self.dateManager.dateTime(self)
    }
    
//    var elapsedPeriod: String {
//        
//        let interval = Calendar.current.dateComponents([.year, .month, .day], from: self, to: Date())
//        
//        let year = interval.year ?? 0
//        let month = interval.month ?? 0
//        let day = interval.day ?? 0
//        
//        if year > 0 {
//            return year == 1
//                ? "\(year)" + " " + "year ago".localized
//                : "\(year)" + " " + "years ago".localized
//        } else if month > 0 {
//            return month == 1
//                ? "\(month)" + " " + "month ago".localized
//                : "\(month)" + " " + "months ago".localized
//        } else if day > 0 {
//            if (22...31).contains(day) {
//                return "4 " +  "weeks ago".localized
//            } else if (15...21).contains(day) {
//                return "3 " + "weeks ago".localized
//            } else if (8...14).contains(day) {
//                return "2 " + "weeks ago".localized
//            } else if (2...7).contains(day) {
//                return "last week".localized
//            } else {
//                return day == 1
//                    ? "yesterday".localized
//                    : "\(day)" + " " + "days ago".localized
//            }
//        } else {
//            // if you want to present hours
//            // let interval = Calendar.current.dateComponents([.hour, .minute, .second], from: self, to: Date())
//            return "a moment ago".localized
//        }
//    }
    
}

extension Calendar {
    static let iso8601 = Calendar(identifier: .iso8601)
}
