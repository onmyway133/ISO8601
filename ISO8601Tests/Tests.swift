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

  func testBasic() {
    let date = Date(timeIntervalSince1970: 1460111130)

    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08T10:25:30Z"), date)
    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08T102530Z"), date)
    XCTAssertEqual(Formatter.shared.date(string: "20160408T10:25:30Z"), date)
    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08 10:25:30Z"), date)
    XCTAssertEqual(Formatter.shared.date(string: "20160408 10:25:30Z"), date)

    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08 11:25:30+0100"), date)
    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08 11:25:30     +0100"), date)
    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08 11:25:30 +0100"), date)
    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08 112530 +010000"), date)
    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08 202530GMT+1000"), date)
    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08 122530 GMT+0200"), date)
    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08 08:25:30-0200"), date)
    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08 08:25:30-02:00"), date)
    XCTAssertEqual(Formatter.shared.date(string: "20160408 08:25:30-02:00"), date)
  }

  func testMilliSeconds() {
    let date = Date(timeIntervalSince1970: 1460111130)

    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08T10:25:30.000Z"), date)
    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08T10:25:30,000Z"), date)
    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08T10:25:30.000 +0000"), date)
    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08T10:25:30.000GMT +0000"), date)
    XCTAssertEqual(Formatter.shared.date(string: "2016-04-08T10:25:30.0000000+00:00"), date)
  }

  func testMilliSeconds2() {
    let date = Date(timeIntervalSince1970: 1524025255)

    XCTAssertEqual(Formatter.shared.date(string: "2018-04-18T04:20:55.000Z"), date)
  }

  func testTimezoneZ() {
    let date = Date(timeIntervalSince1970: 1469258663)
    let string = "2016-07-23T07:24:23Z"

    XCTAssertEqual(Formatter.shared.string(date: date), string)
    XCTAssertEqual(Formatter.shared.date(string: string), date)
  }

  func testTimezone() {
    let date = Date(timeIntervalSince1970: 1460111130)
    let string = "2016-04-08T10:25:30 +0000"

    var config = Config()
    config.timeZoneIdentifier = " +0000"
    let formatter = Formatter(config: config)

    XCTAssertEqual(formatter.string(date: date), string)
    XCTAssertEqual(formatter.date(string: string), date)
  }
}
