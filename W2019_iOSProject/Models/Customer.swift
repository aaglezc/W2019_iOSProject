//
//  Customer.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-21.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import Foundation

class Customer: User
{
    
    private var _custName: String?
    private var _address: String?
    private var _email: String?
    private var _creditCardInfo: String?
    private var _shippingInfo: String?
    private var _shoppingCart: [ShoppingCart]
    private var _orders : [Order]
    
    
    var custName: String{
        get{
            return _custName ?? "NO Customer Info"
        }
        set{
            _custName = newValue
        }
    }
    var address: String{
        get{
            return _address ?? "NO Address Info"
        }
        set{
            _address = newValue
        }
    }
    var email: String{
        get{
            return _email ?? "NO email Info"
        }
        set{
            _email = newValue
        }
    }
    var shippingInfo:String
    {
        get
        {
            return _shippingInfo ?? "NO Shipping Info"
        }
        set
        {
            _shippingInfo = newValue
        }
    }
    var creditCardInfo:String
    {
        get
        {
            return _creditCardInfo ?? "NO Credit Card Info"
        }
        set
        {
            _creditCardInfo = newValue
        }
    }
    var shoppingCart: [ShoppingCart]
    {
        get
        {
            return _shoppingCart
        }
        set
        {
            _shoppingCart = newValue
        }
    }
    
    var orders: [Order]
    {
        get
        {
            return _orders
        }
        set
        {
            _orders = newValue
        }
    }
    override init()
    {
        self._custName = String()
        self._address = String()
        self._email = String()
        self._creditCardInfo = String()
        self._shippingInfo = String()
        self._shoppingCart = [ShoppingCart]()
        self._orders = [Order]()
        
        super.init()
    }
    
    override init(userId: String, password: String, loginStatus: String)
    {
        self._shoppingCart = [ShoppingCart]()
        self._orders = [Order]()
        super.init(userId: userId, password: password, loginStatus: loginStatus)
        
    }
    
    func register(CustomerName: String, Address: String, eMail: String, CreditCardInfo: String, ShippingInfo: String, userId: String, password: String, loginStatus: String) -> Bool
    {
        
        // Validations
        
        self._custName = CustomerName
        self._address = Address
        self._email = eMail
        self._creditCardInfo = CreditCardInfo
        self._shippingInfo = ShippingInfo
        super.userId = userId
        super.password = password
        //super.loginStatus = loginStatus
        
        return true
    }
    
    func login()
    {
        
    }
    
    func updateProfile(customers:[Customer]) -> Bool
    {
        //Validate customer.userId and customer.password in customers
        for i in customers
        {
            if i.userId == self.userId
            {
                i.custName       = self.custName
                i.address        = self.address
                i.email          = self.email
                i.shippingInfo   = self.shippingInfo
                i.creditCardInfo = self.creditCardInfo
                i.loginStatus    = "Profile Updated"
                print("---------------Profile Updated---------------")
                i.display()
                return true
            }
            
        }
        return false
    }
    
    func checkOut()
    {
        let order = Order(orId: orders.count+1, dtCreate: Date(), dtShip: Date(), cxName: self._custName ?? "", cxId: self.userId, Status: "Order Created")
        self._orders.append(order)
        for s in self._shoppingCart
        {
            let od = OrderDetails(orderId: s.productId.ProductId, productId: s.productId.ProductId, productName: s.productId.ProductName, quantity: s.quantity, unitCost: Float(s.productId.Price))
            order.orderDetalis.append(od)
        }
        
        
        
    }
    
    override func display()
    {
        print("************Customer Details*************")
        print("Customer Name: \(self._custName!)")
        print("Address: \(self._address!)")
        print("eMail Address: \(self._email!)")
        print("Credit Card Information: \(self._creditCardInfo!)")
        print("Shipping Information: \(self._shippingInfo!)")
    }
}

