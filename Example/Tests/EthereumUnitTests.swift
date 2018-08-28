//
//  EthereumUnitTests.swift
//  EthereumUnitSwift_Tests
//
//  Created by Dmitriy Karachentsov on 28/8/18.
//  Copyright © 2018 Anchor. All rights reserved.
//

import XCTest
import EthereumUnitSwift
import Nimble
import BigInt

class EthereumUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNames() {
        expect(EthereumUnit.ether.name).to(equal("Ether"))
        expect(EthereumUnit.wei.name).to(equal("Wei"))
    }
    
}
