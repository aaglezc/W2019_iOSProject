//
//  Orders.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-19.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import Foundation

class Order : IDisplay
{
    private var _orderId: Int?
    private var _dateCreated: Date
    private var _dateShipped : Date
    private var _customerName: String
    private var _customerId: String
    private var _status: String
    private var _shippingInfo : ShippingInfo
    private var _orderDetails : [OrderDetails]
    
    
    var orderId: Int
    {
        get{
            return _orderId!
        }
        set{
            _orderId = newValue
        }
    }
    var dateCreated: Date
    {
        get{
            return _dateCreated
        }
        set{
            _dateCreated = newValue
        }
    }
    var dateShipped: Date
    {
        get{
            return _dateShipped
        }
        set{
            _dateShipped = newValue
        }
    }
    var customerName:String
    {
        get
        {
            return _customerName
        }
        set
        {
            _customerName = newValue
        }
    }
    var customerID: String
    {
        get{
            return _customerId
        }
        set{
            _customerId = newValue
        }
    }
    var status: String{
        get{
            return _status
        }
        set{
            _status = newValue
        }
    }
    var shippingInfo: ShippingInfo
    {
        get{
            return _shippingInfo
        }
        set{
            _shippingInfo = newValue
        }
    }
    var orderDetalis: [OrderDetails]
    {
        get{
            return _orderDetails
        }
        set{
            _orderDetails = newValue
        }
    }
    init()
    {
        self._orderId       = 0
        self._dateCreated = Date()
        self._dateShipped = Date()
        self._customerName = String()
        self._customerId = String()
        self._status = String()
        self._shippingInfo = ShippingInfo()
        self._orderDetails = [OrderDetails]()
        
        
    }
    
    init (orId: Int, dtCreate: Date, dtShip: Date, cxName: String, cxId: String, Status: String)
    {
        self._orderId = orId
        self._dateCreated = dtCreate
        self._dateShipped = dtShip
        self._customerName = cxName
        self._customerId = cxId
        self._status = Status
        self._shippingInfo = ShippingInfo()
        self._orderDetails = [OrderDetails]()
        
    }
    
    func placeOrder(shippingId: Int, shippingType: String, shippingCost: Float, shippingRegionId: Int)
    {
        self._shippingInfo.shippingCost = shippingCost
        self._shippingInfo.shippingRegionId = shippingRegionId
        self._shippingInfo.shippingType = shippingType
        self._shippingInfo.shippingId = shippingId
        
    }
    
    func CalcGrandTotal() -> Float
    {
        var total: Float = 0.0
        for od in self._orderDetails
        {
            total = total + Float(od.subTotal)
        }
        return Float(total)
    }
    
    func display()
    {
        print("************Order Details*************")
        print("Order ID: \(self._orderId!)")
        print("Order Date: \(self._dateCreated.DateFormat())")
        print("Shipping Date: \(self._dateShipped.DateFormat())")
        print("Customer Name: \(self._customerName)")
        print("Customer ID: \(self._customerId)")
        print("Order Status: \(self._status)")
        //print("Shipping ID: \(self._shippingId)")
        
        
    }
    
}

