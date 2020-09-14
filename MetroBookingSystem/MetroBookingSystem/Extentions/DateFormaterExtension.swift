//
//  DateFormaterExtension.swift
//  MetroBookingSystem
//
//  Created by Runa Alam on 12/9/20.
//

import UIKit

extension DateFormatter {
    func getString(date: Date) -> String {
        self.dateStyle = .medium
        self.timeStyle = .none
        self.locale = Locale.current
        return self.string(from: date)
    }
    
    func getDate(strDate: String) -> Date {
        
        self.locale = Locale.current // set locale to reliable US_POSIX
        self.timeZone = NSTimeZone.local
        self.calendar = Calendar(identifier: .gregorian)
        self.dateStyle = .medium
        self.timeStyle = .none
        return self.date(from: strDate)!
    }
}
