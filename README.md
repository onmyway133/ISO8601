# ISO8601

❤️ Support my app ❤️ 

- [Push Hero - pure Swift native macOS application to test push notifications](https://www.producthunt.com/posts/push-hero-2)
- [PastePal - Pasteboard, note and shortcut manager](https://www.producthunt.com/posts/pastepal)
- [Frame recorder - Recorder gif and video with frame](https://www.producthunt.com/posts/frame-recorder)
- [Alias - App and file shortcut manager](https://www.producthunt.com/posts/alias-shortcut-manager)
- [Other apps](https://onmyway133.github.io/projects/)

❤️❤️😇😍🤘❤️❤️

ISO8601 in Swift

[![Version](https://img.shields.io/cocoapods/v/ISO8601.svg?style=flat)](http://cocoadocs.org/docsets/ISO8601)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/ISO8601.svg?style=flat)](http://cocoadocs.org/docsets/ISO8601)
[![Platform](https://img.shields.io/cocoapods/p/ISO8601.svg?style=flat)](http://cocoadocs.org/docsets/ISO8601)
<img src="https://img.shields.io/badge/%20in-swift%204.0-orange.svg">

![](Screenshots/Banner.png)

## Description

My answer on [How do I get ISO 8601 date in iOS?](http://stackoverflow.com/a/37082414/1418457)

## Usage

### Formatter

Create a new formatter

```swift
var config = Config()
config.timeZoneIdentifier = " +0000"
let formatter = Formatter(config: config)
```

or use the default

```swift
Formatter.shared
```

### Convert string to date

```swift
Formatter.shared.date(string: "2016-04-08T10:25:30Z")		// extended format with Z
Formatter.shared.date(string: "20160408 10:25:30Z")			// basic format with Z
Formatter.shared.date(string: "2016-04-08 112530 +010000")	// extended format with timezone offset
Formatter.shared.date(string: "2016-04-08 202530GMT+1000")	// extended format with GMT
Formatter.shared.date(string: "2016-04-08T10:25:30.000Z")	// milliseconds
```

### Convert date to string

```swift
let date = Date(timeIntervalSince1970: 1460111130)
Formatter.shared.string(date: date) // 2016-04-08T10:25:30Z	// timezone Z
```

## Installation

**ISO8601** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ISO8601', git: 'https://github.com/onmyway133/ISO8601'
```

**ISO8601** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "onmyway133/ISO8601"
```

## Author

Khoa Pham, onmyway133@gmail.com

## Contributing

We would love you to contribute to **ISO8601**, check the [CONTRIBUTING](https://github.com/onmyway133/ISO8601/blob/master/CONTRIBUTING.md) file for more info.

## License

**ISO8601** is available under the MIT license. See the [LICENSE](https://github.com/onmyway133/ISO8601/blob/master/LICENSE.md) file for more info.
