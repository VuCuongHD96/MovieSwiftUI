//
//  DictionaryPrinter.swift
//  MovieSwiftUI
//
//  Created by Work on 20/03/2023.
//

import Foundation

struct DictionaryPrinter {
    
    static func parseToDictionary(from data: Data?) -> [String: Any] {
        guard let data = data else {
            return [String: Any]()
        }
        if let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) {
            if let dataDictionary = jsonData as? [String: Any] {
                return dataDictionary
            }
        }
        return [String: Any]()
    }
    
    static func printBeauty(dictionary: [String : Any]) {
        if let data = try? JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted),
           let dataString = String(data: data, encoding: .utf8) {
            print(dataString)
        }
    }
    
    static func printBeauty(data: Data?) {
        let dictionary = parseToDictionary(from: data)
        printBeauty(dictionary: dictionary)
    }
}
