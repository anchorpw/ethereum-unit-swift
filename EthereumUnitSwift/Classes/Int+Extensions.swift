//
//  Int+Extensions.swift
//  EthereumUnitSwift
//
//  Created by Dmitriy Karachentsov on 28/8/18.
//

import Foundation
import BigInt

public extension SignedInteger where Self: FixedWidthInteger {
    
    init?(hexString: String) {
        var hex = hexString
        if hex.contains("0x") {
            hex = String(hex.dropFirst(2))
        }
        guard let value = Self(hex, radix: 16) else {
            return nil
        }
        self = value
    }
    
}

public extension BigInt {
    
    init?(hexString: String) {
        var hex = hexString
        if hex.contains("0x") {
            hex = String(hex.dropFirst(2))
        }
        guard let value = BigInt(hex, radix: 16) else {
            return nil
        }
        self = value
    }
    
}
