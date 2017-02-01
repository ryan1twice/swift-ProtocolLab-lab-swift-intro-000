//
//  BankVault.swift
//  Protocols
//
//  Created by Papa Roach on 8/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//


class BankVault {
    
    let name: String
    let address: String
    var amount: Double = 0.0
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    }
}

protocol ProvideAccess {
    func allowEntryWithPassword(_ password: [Int]) -> Bool
}

extension BankVault {
    func allowEntryWithPassword(_ password: [Int]) -> Bool {
        guard password.count > 1 else {
            //print("RYAN-Pass too small")
            return false
        }
        guard password.count <= 10 else {
            //print("RYAN-Pass too large")
            return false
        }
        
        for (index, num) in password.enumerated() {
            if index%2 == 0 { // Every other digit
                if num%2 != 0 { // Number is odd (fails condition)
                    //print("RYAN-Index: \(index) is not even (\(num))")
                    return false
                }
            }
        }
        // Password meets conditions
        return true
    }
}
