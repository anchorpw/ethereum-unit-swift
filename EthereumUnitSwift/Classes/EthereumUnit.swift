//
//  Unit.swift
//  EthereumUnitSwift
//
//  Created by Dmitriy Karachentsov on 27/8/18.
//

import Foundation
import BigInt

public enum EthereumUnit {
    case tether
    case gether
    case mether
    case kether
    case ether
    case finney
    case szabo
    case gwei
    case mwei
    case kwei
    case wei
}


// MARK: - <#Description#>
public extension EthereumUnit {
    
    typealias Unit = EthereumUnit
    
    /// <#Description#>
    var name: String {
        let association: [Unit: String] = [
            .tether: "Tether",
            .gether: "Gether",
            .mether: "Mether",
            .kether: "Kether",
            .ether:  "Ether",
            .finney: "Finney",
            .szabo:  "Szabo",
            .gwei:   "Gwei",
            .mwei:   "Mwei",
            .kwei:   "Kwei",
            .wei:    "Wei",
            ]
        return association[self]!

    }
    
    /// <#Description#>
    var decimals: Int {
        let association: [Unit: Int] = [
            .tether: 30,
            .gether: 27,
            .mether: 24,
            .kether: 21,
            .ether:  18,
            .finney: 15,
            .szabo:  12,
            .gwei:   9,
            .mwei:   6,
            .kwei:   3,
            .wei:    0,
            ]
        return association[self]!
    }
    
}
