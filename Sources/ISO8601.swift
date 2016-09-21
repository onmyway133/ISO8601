//
//  ISO8601.swift
//  ISO8601
//
//  Created by Khoa Pham on 06/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public struct DateFormatter {
  
  public static let stringToDateFormatter: Foundation.DateFormatter = {
    let formatter = Foundation.DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "yyyyMMdd HHmmssZ"

    return formatter
  }()

  public static let dateToStringFormatter: Foundation.DateFormatter = {
    let formatter = Foundation.DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    formatter.timeZone = TimeZone(secondsFromGMT: 0)

    return formatter
  }()

  /**
   Parse an ISO8601 string to NSDate

   - parameter string: The string to parse

   - returns: A date representation of string formatted using ISO8601, nil if fails
   */
  public static func date(string: String) -> Date? {
    var basicString = string

    if let regex = try? NSRegularExpression(pattern: "[0-9]{4}-[0-9]{2}-[0-9]{2}", options: []),
      let result = regex.firstMatch(in: string, options: .anchored, range: NSMakeRange(0, string.characters.count)) {
      basicString = (basicString as NSString).replacingOccurrences(of: "-", with: "", options: [], range: result.range)
    }

    basicString = basicString
      .replacingOccurrences(of: ":", with: "")
      .replacingOccurrences(of: "GMT", with: "")
      .replacingOccurrences(of: "T", with: " ")

    return stringToDateFormatter.date(from: basicString)
  }

  /**
   Parse a date to ISO8601 string

   - parameter date: The date to parse

   - returns: A string representation of date formatted using ISO8601
   */
  public static func string(date: Date, identifier: String = " +0000") -> String {
    return dateToStringFormatter.string(from: date) + identifier
  }
}
