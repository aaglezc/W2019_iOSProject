//
//  ShippingInfo.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-19.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import Foundation

class ShippingInfo : IDisplay
{
    private var _shippingId: Int
    private var _shippingType: String
    private var _shippingCost: Float
    private var _shippingRegionId: Int
    
    var shippingId: Int{
        get{
            return _shippingId
        }
        set{
            _shippingId = newValue
        }
    }
    
    var shippingType: String{
        get{
            return _shippingType
        }
        set{
            _shippingType = newValue
        }
    }
    
    var shippingCost: Float{
        get{
            return _shippingCost
        }
        set{
            _shippingCost = newValue
        }
    }
    
    var shippingRegionId: Int{
        get{
            return _shippingRegionId
        }
        set{
            _shippingRegionId = newValue
        }
    }
    
    init()
    {
        self._shippingId = 0
        self._shippingType = String()
        self._shippingCost = 0
        self._shippingRegionId = 0
    }
    
    init (shippingId: Int, shippingType: String, shippingCost: Float, shippingRegionId: Int)
    {
        self._shippingId = shippingId
        self._shippingType = shippingType
        self._shippingCost = shippingCost
        self._shippingRegionId = shippingRegionId
        
    }
    
    func updateShippingInfo()
    {
        
    }
    
    func display()
    {
        print("************Shipping Information Details*************")
        print("Shipping ID: \(self._shippingId )")
        print("Shipping Type: \(self._shippingType)")
        print("Shipping Cost: \(self._shippingCost.currencyformat())")
        print("Shipping Region Id: \(self.shippingRegionId)")
        
    }
    
}
