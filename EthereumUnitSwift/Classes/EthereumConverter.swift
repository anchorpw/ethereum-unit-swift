//
//  EthereumConverter.swift
//  EthereumUnitSwift
//
//  Created by Dmitriy Karachentsov on 27/8/18.
//

import Foundation
import BigInt

public class EthereumConverter {
    
    /// Number of digits after the floating point.
    open var floatingDigits = 0
    
    /// The decimal separator
    open var decimalSeparator: String = "."
    
    /// The grouping separator
    open var groupingSeparator: String = ","
    
    /// Initializes an EthereumConverter with locale
    ///
    /// - Parameter locale: locale to initialize with locale
    public init(locale: Locale) {
        decimalSeparator = locale.decimalSeparator ?? "."
        groupingSeparator = locale.groupingSeparator ?? ","
    }
    
    /// Converts a string number like `1000` to `unit`
    ///
    /// - Parameters:
    ///   - numberString: string number
    ///   - unit: ethereum unit type
    /// - Returns: Converted string number or nil
    open func string(numberString: String, unit: EthereumUnit = .ether) -> String? {
        guard let number = BigInt(numberString) else {
            return nil
        }
        return self.string(number: number, decimals: unit.decimals)
    }
    
    /// Converts a hex wei number like `0x10` to `unit`
    ///
    /// - Parameters:
    ///   - hexString: hex string number
    ///   - unit: ethereum unit type
    /// - Returns: Converted string number or nil
    open func string(hexString: String, unit: EthereumUnit = .ether) -> String? {
        guard let number = BigInt(hexString: hexString) else {
            return nil
        }
        return self.string(number: number, decimals: unit.decimals)
    }
    
    /// Converts weis to 'unit'
    ///
    /// - Parameters:
    ///   - number: integer number
    ///   - unit: ethereum unit type
    /// - Returns: Converted string number
    open func string(number: BigInt, unit: EthereumUnit = .ether) -> String {
        return self.string(number: number, decimals: unit.decimals)
    }
    
}

private extension EthereumConverter {
    
    func string(number: BigInt, decimals: Int) -> String {
        let divider = BigInt(10).power(decimals)
        let (quotient, remainder) = number.quotientAndRemainder(dividingBy: divider)
        let integerPart = self.integerValue(number: quotient)
        var result = [integerPart]
        let floatNumber = BigInt(sign: .plus, magnitude: remainder.magnitude)
        let floatingPart = self.floatingPoint(number: floatNumber, decimals: decimals)
        if !floatingPart.isEmpty {
            result += [decimalSeparator, floatingPart]
        }
        return result.joined()
    }
    
    func integerValue(number: BigInt) -> String {
        var integerString = number.description
        let end = number.sign == .minus ? 1 : 0
        stride(from: integerString.count - 3, to: end, by: -3).forEach { offset in
            let index = integerString.index(integerString.startIndex, offsetBy: offset)
            integerString.insert(contentsOf: groupingSeparator, at: index)
        }
        return integerString
    }
    
    func floatingPoint(number: BigInt, decimals: Int) -> String {
        var number = number
        if floatingDigits == 0 || number == 0 {
            return ""
        }
        let digits = number.description.count
        
        if decimals > floatingDigits {
            number /= BigInt(10).power(decimals - floatingDigits)
        }
        var string = number.description
        if digits < decimals {
            string = String(repeating: "0", count: decimals - digits) + string
        }
        return string
    }
    
}
