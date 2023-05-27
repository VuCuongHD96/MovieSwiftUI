//
//  DateFormatter.swift
//  MovieSwiftUI
//
//  Created by Work on 22/05/2023.
//

import Foundation

struct DateFormatType {
    
    let value: String
    
    static let yearMonthDay = DateFormatType(value: "yyyy-MM-dd")
}

struct DateTransformer {
    
    let dateFormatter = DateFormatter()
    let calendar = Calendar.current
    
    func stringToInt(dateString: String, dateFormatType: DateFormatType, component: Calendar.Component) -> Int? {
        dateFormatter.dateFormat = dateFormatType.value
        if let date = dateFormatter.date(from: dateString) {
            return calendar.component(component, from: date)
        } else {
            return nil
        }
    }
}
