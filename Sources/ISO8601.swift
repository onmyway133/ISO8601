//
//  ISO8601.swift
//  ISO8601
//
//  Created by Khoa Pham on 06/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public struct DateFormatter {
  
  public static let stringToDateFormatter: NSDateFormatter = {
    let formatter = NSDateFormatter()
    formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    formatter.dateFormat = "yyyyMMdd HHmmssZ"

    return formatter
  }()

  public static let dateToStringFormatter: NSDateFormatter = {
    let formatter = NSDateFormatter()
    formatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    formatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)

    return formatter
  }()

  /**
   Parse an ISO8601 string to NSDate

   - parameter string: The string to parse

   - returns: A date representation of string formatted using ISO8601, nil if fails
   */
  public static func date(string string: String) -> NSDate? {
    var basicString = string

    if let regex = try? NSRegularExpression(pattern: "[0-9]{4}-[0-9]{2}-[0-9]{2}", options: []),
      result = regex.firstMatchInString(string, options: .Anchored, range: NSMakeRange(0, string.characters.count)) {
      basicString = (basicString as NSString).stringByReplacingOccurrencesOfString("-", withString: "", options: [], range: result.range)
    }

    basicString = basicString
      .stringByReplacingOccurrencesOfString(":", withString: "")
      .stringByReplacingOccurrencesOfString("GMT", withString: "")
      .stringByReplacingOccurrencesOfString("T", withString: " ")

    return stringToDateFormatter.dateFromString(basicString)
  }

  /**
   Parse a date to ISO8601 string

   - parameter date: The date to parse

   - returns: A string representation of date formatted using ISO8601
   */
  public static func string(date date: NSDate) -> String {
    return dateToStringFormatter.stringFromDate(date).stringByAppendingString(" +0000")
  }
}
