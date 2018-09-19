//
//  Double+extension.swift
//  EpicvsIkon
//
//  Created by Jason Sanchez on 9/19/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import Foundation

extension Double {
    var currencyFormatter: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(from: NSNumber(value: self))!
    }
    
    var decimalFormatter: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        return formatter.string(from: NSNumber(value: self))!
    }
    
    var noneFormatter: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .none
        
        return formatter.string(from: NSNumber(value: self))!
    }
}
