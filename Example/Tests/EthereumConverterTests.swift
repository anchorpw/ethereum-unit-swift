//
//  EthereumConverterTests.swift
//  EthereumUnitSwift_Tests
//
//  Created by Dmitriy Karachentsov on 28/8/18.
//  Copyright © 2018 Anchor. All rights reserved.
//

import XCTest
import EthereumUnitSwift
import Nimble
import BigInt

class EthereumConverterTests: XCTestCase {
    
    var etherConverter: EthereumConverter!
    
    override func setUp() {
        super.setUp()
        let locale = Locale.autoupdatingCurrent
        etherConverter = EthereumConverter(locale: locale)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        etherConverter = nil
        super.tearDown()
    }
    
    func testZeroToEthers() {
        let string = etherConverter.string(number: BigInt(0))
        expect(string).to(equal("0"))
    }
    
    func testZeroToEthers1() {
        etherConverter.floatingDigits = Int.max
        let string = etherConverter.string(number: BigInt(0))
        expect(string).to(equal("0"))
    }
    
    func testOneWeiToEthers() {
        etherConverter.floatingDigits = Int.max
        let string = etherConverter.string(number: BigInt(1))
        expect(string).to(equal("0.000000000000000001"))
    }
    
    func testOneWeiToWeis() {
        etherConverter.floatingDigits = Int.max
        let string = etherConverter.string(number: BigInt(1), unit: .wei)
        expect(string).to(equal("1"))
    }
    
    func testOneWeiToWeis1() {
        etherConverter.floatingDigits = 4
        let string = etherConverter.string(number: BigInt(1), unit: .wei)
        expect(string).to(equal("1"))
    }
    
    func testExample() {
        etherConverter.floatingDigits = Int.max
        let string = etherConverter.string(hexString: "0x1")
        expect(string).to(equal("0.000000000000000001"))
    }
    
    func testWeisNumberToEthers() {
        etherConverter.floatingDigits = Int.max
        let string = etherConverter.string(number: BigInt(2244297398313907141))
        expect(string).to(equal("2.244297398313907141"))
    }
    
    func testCustomDecimalSeparator() {
        etherConverter.floatingDigits = Int.max
        etherConverter.decimalSeparator = "|"
        let string = etherConverter.string(number: BigInt(2244297398313907141))
        expect(string).to(equal("2|244297398313907141"))
    }
    
    func testConvertionWithNonValidHex() {
        let string = etherConverter.string(hexString: "0xhello")
        expect(string).to(beNil())
    }
    
    func testConvertionWithSpecificFloatingDigits() {
        etherConverter.floatingDigits = 4
        let string = etherConverter.string(number: BigInt(2244297398313907141))
        expect(string).to(equal("2.2442"))
    }
    
    func testConvertionToFinneyWithSpecificFloatingDigits() {
        etherConverter.floatingDigits = 4
        let string = etherConverter.string(number: BigInt(2244297398313907141), unit: .finney)
        expect(string).to(equal("2,244.2973"))
    }
    
    func testConvertionStringNumberToEthers() {
        etherConverter.floatingDigits = 4
        let string = etherConverter.string(numberString: "2244297398313907141")
        expect(string).to(equal("2.2442"))
    }
    
    func testConvertionNonValidStringNumberToEthers() {
        etherConverter.floatingDigits = 4
        let string = etherConverter.string(numberString: "hello")
        expect(string).to(beNil())
    }
    
    func testUsingGroupingSeparator() {
        etherConverter.floatingDigits = 4
        let string = etherConverter.string(number: BigInt(2244297398313907141), unit: .wei)
        expect(string).to(equal("2,244,297,398,313,907,141"))
    }
    
    func testUsingGroupingSeparatorWithNegativeValue() {
        etherConverter.floatingDigits = 4
        let string = etherConverter.string(number: BigInt(-2244297398313907141), unit: .wei)
        expect(string).to(equal("-2,244,297,398,313,907,141"))
    }
    
    func testUsingGroupingSeparatorWithNegativeValue1() {
        etherConverter.floatingDigits = 4
        let string = etherConverter.string(number: BigInt(-224429739831390714), unit: .wei)
        expect(string).to(equal("-224,429,739,831,390,714"))
    }
    
    func testConvertionNegativeValue() {
        etherConverter.floatingDigits = 4
        let string = etherConverter.string(number: BigInt(-2244297398313907141))
        expect(string).to(equal("-2.2442"))
    }
    
}
