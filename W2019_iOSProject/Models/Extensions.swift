//
//  Extensions.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-19.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import Foundation

enum Genero {
    case Alternative
    case Pop
    case Rock
    case RythmBlues
    case Classical
    case Country
    case Blues
    case Jazz
    case Dance
    case Electronic
    case HipHop
    case Indie
    case Latin
    case NewAge
}


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

extension String
{
    func isValidEmail() -> Bool
    {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@",emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    func isValidPassword() -> Bool {
        //guard self != nil else { return false }
        
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "(?=.*[A-Z])(?=.*[0-9])(?=.*[a-z]).{8,}")
        return passwordTest.evaluate(with: self)
    }
    
}
