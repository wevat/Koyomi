//
//  DateExtension.swift
//  Pods
//
//  Created by Shohei Yokoyama on 2016/10/14.
//
//

import UIKit

extension Date {
    func formated(withFormat format: String = "yyyy/MM/dd") -> Date? {
        let formatter: DateFormatter = .init()
        formatter.dateFormat = format
        let dateString = formatter.string(from: self)
        return formatter.date(from: dateString)
    }
    
    func daysSince(_ anotherDate: Date, usingCalendar calendar: Calendar) -> Int? {
        if let fromDate = dateFromComponents(self, calendar), let toDate = dateFromComponents(anotherDate, calendar) {
            let components = calendar.dateComponents([.day], from: fromDate, to: toDate)
            return components.day
        }
        return nil
    }
    
    private func dateFromComponents(_ date: Date, _ calendar: Calendar) -> Date? {
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        return calendar.date(from: components)
    }
}

