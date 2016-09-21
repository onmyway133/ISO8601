//
//  Tests.swift
//  ISO8601
//
//  Created by Khoa Pham on 06/05/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import XCTest
import ISO8601

class Tests: XCTestCase {

  func test1() {
    let date = NSDate(timeIntervalSince1970: 1460111130)

    XCTAssertEqual(DateFormatter.date(string: "2016-04-08T10:25:30Z"), date as Date)
    XCTAssertEqual(DateFormatter.date(string: "2016-04-08T102530Z"), date as Date)
    XCTAssertEqual(DateFormatter.date(string: "20160408T10:25:30Z"), date as Date)
    XCTAssertEqual(DateFormatter.date(string: "2016-04-08 10:25:30Z"), date as Date)
    XCTAssertEqual(DateFormatter.date(string: "20160408 10:25:30Z"), date as Date)

    XCTAssertEqual(DateFormatter.date(string: "2016-04-08 11:25:30+0100"), date as Date)
    XCTAssertEqual(DateFormatter.date(string: "2016-04-08 11:25:30     +0100"), date as Date)
    XCTAssertEqual(DateFormatter.date(string: "2016-04-08 11:25:30 +0100"), date as Date)
    XCTAssertEqual(DateFormatter.date(string: "2016-04-08 112530 +010000"), date as Date)
    XCTAssertEqual(DateFormatter.date(string: "2016-04-08 202530GMT+1000"), date as Date)
    XCTAssertEqual(DateFormatter.date(string: "2016-04-08 122530 GMT+0200"), date as Date)
    XCTAssertEqual(DateFormatter.date(string: "2016-04-08 08:25:30-0200"), date as Date)
    XCTAssertEqual(DateFormatter.date(string: "2016-04-08 08:25:30-02:00"), date as Date)
    XCTAssertEqual(DateFormatter.date(string: "20160408 08:25:30-02:00"), date as Date)
  }

  func test2() {
    let date = NSDate(timeIntervalSince1970: 1460111130)
    let string = "2016-04-08T10:25:30 +0000"

    XCTAssertEqual(DateFormatter.string(date: date as Date), string)
    XCTAssertEqual(DateFormatter.date(string: string), date as Date)
  }

  func test3() {
    let date = NSDate(timeIntervalSince1970: 1469258663)
    let string = "2016-07-23T07:24:23Z"

    XCTAssertEqual(DateFormatter.string(date: date as Date, identifier: "Z"), string)
    XCTAssertEqual(DateFormatter.date(string: string), date as Date)
  }
}
