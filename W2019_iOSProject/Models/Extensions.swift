//
//  Extensions.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-19.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import Foundation
extension Date
{
    func DateFormat()-> String
    {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "EEEE, dd MMMM, yyyy"
        let formattedDate = dateFormatterPrint.string(from: self)
        return formattedDate
    }
}

extension Float
{
    func currencyformat() -> String
    {
        return "$\(self)"
        
    }
    
}

extension Int
{
    public func unit() -> String
    {
        return String.init(format: "%d Units", self)
    }
}
