//
//  OrderDetails.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-19.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import Foundation

class OrderDetails : IDisplay
{
    private var _orderId: Int
    private var _productId: Int
    private var _productName: String
    private var _quantity: Int
    private var _unitCost: Float
    private var _subTotal: Float
    {
        return _unitCost * Float(self._quantity)
    }
    
    
    var orderId: Int{
        get{
            return _orderId
        }
        set{
            _orderId = newValue
        }
    }
    
    var productId: Int{
        get{
            return _productId
        }
        set{
            _productId = newValue
        }
    }
    
    var productName: String{
        get{
            return _productName
        }
        set{
            _productName = newValue
        }
    }
    
    var quantity: Int{
        get{
            return _quantity
        }
        set{
            _quantity = newValue
        }
    }
    
    var unitCost: Float{
        get{
            return _unitCost
        }
        set{
            _unitCost = newValue
        }
    }
    var subTotal: Float{
        get{
            return _subTotal
        }
    }
    
    
    init()
    {
        self._orderId = 0
        self._productId = 0
        self._productName = String()
        self._quantity = 0
        self._unitCost = 0.0
        
    }
    
    init (orderId: Int, productId: Int, productName: String, quantity: Int, unitCost: Float)
    {
        self._orderId = orderId
        self._productId = productId
        self._productName = productName
        self._quantity = quantity
        self._unitCost = unitCost
        
        
    }
    
    func display()
    {
        print("************Order Information Details*************")
        print("Order Id: \(self._orderId )")
        print("Product Id: \(self._productId)")
        print("Product Namet: \(self._productName)")
        print("Quantity: \(self._quantity)")
        print("Unit Cost: \(self._unitCost.currencyformat())")
        print("Sub Total: \(self._subTotal.currencyformat())")
        
    }
    
}
