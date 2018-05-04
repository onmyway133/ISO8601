//
//  ISO8601.swift
//  ISO8601
//
//  Created by Khoa Pham on 06/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation

public struct Config {
  public var timeZoneIdentifier: String = "Z"

  public init() {
    
  }
}

public struct Formatter {

  // MARK: - Shared

  public static let shared = Formatter(config: Config())

  // MARK: - Properties

  public let config: Config

  // MARK: Init

  public init(config: Config) {
    self.config = config
  }

  // MARK: - DateFormatter

  public var stringToDateFormatter: DateFormatter = {
    let formatter = Foundation.DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "yyyyMMdd HHmmssZ"

    return formatter
  }()

  public var stringToDateMillisecondsFormatter: DateFormatter = {
    let formatter = Foundation.DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "yyyyMMdd HHmmss.SSSZ"

    return formatter
  }()

  public var dateToStringFormatter: DateFormatter = {
    let formatter = Foundation.DateFormatter()
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    formatter.timeZone = TimeZone(secondsFromGMT: 0)

    return formatter
  }()

  /**
   Parse an ISO8601 string to Date

   - parameter string: The string to parse

   - returns: A date representation of string formatted using ISO8601, nil if fails
   */
  public func date(string: String) -> Date? {
    var basicString = string

    if let regex = try? NSRegularExpression(pattern: "[0-9]{4}-[0-9]{2}-[0-9]{2}", options: []),
      let result = regex.firstMatch(in: string, options: .anchored, range: NSMakeRange(0, string.count)) {
      basicString = (basicString as NSString).replacingOccurrences(of: "-", with: "", options: [], range: result.range)
    }

    basicString = basicString
      .replacingOccurrences(of: ":", with: "")
      .replacingOccurrences(of: "GMT", with: "")
      .replacingOccurrences(of: "T", with: " ")
      .replacingOccurrences(of: ",", with: ".")

    return stringToDateFormatter.date(from: basicString)
      ?? stringToDateMillisecondsFormatter.date(from: basicString)
  }

  public func string(date: Date) -> String {
    return dateToStringFormatter.string(from: date) + config.timeZoneIdentifier
  }
}
