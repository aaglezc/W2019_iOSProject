//
//  ShoppingCar.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-19.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import Foundation

class ShoppingCart :IDisplay
{
    private var _cartId: Int
    private var _productId: Product
    private var _quantity: Int
    private var _dateAdded: Date
    
    var cartId: Int
    {
        get {
            return _cartId
        }
        set{
            _cartId = newValue
        }
    }
    var productId: Product
    {
        get {
            return _productId
        }
        set{
            _productId = newValue
        }
    }
    var quantity: Int
    {
        get {
            return _quantity
        }
        set{
            _quantity = newValue
        }
    }
    var dateAdded: Date
    {
        get {
            return _dateAdded
        }
        set{
            _dateAdded = newValue
        }
    }
    init()
    {
        self._cartId = Int()
        self._productId = Product()
        self._quantity = Int()
        self._dateAdded = Date()
    }
    
    
    init(cartId: Int, productId: Product, quantity: Int, dateAdded: Date)
    {
        self._cartId = cartId
        self._productId = productId
        self._quantity = quantity
        self._dateAdded = dateAdded
        
    }
    
    func addCartItem(customer : Customer)
    {
        let dd = ShoppingCart(cartId: self._cartId, productId: self._productId, quantity: self._quantity, dateAdded: self._dateAdded)
        customer.shoppingCart.append(dd)
    }
    
    func updateQuantity(customer : Customer, newQty : Int) -> Bool
    {
        //print("Customer Items------>:")
        for c in customer.shoppingCart
        {
            //print("Item:",c._productId!.ProductId)
            if c._cartId == self._cartId
            {
                c._quantity = newQty
                return true
            }
        }
        return false
    }
    
    func SubTotal() -> Double
    {
       let tot = (Double(self._quantity) * self._productId.Price)
        return tot
    }
    
    
    func display()
    {
        print("************Shopping Cart Details*************")
        print("Cart ID: \(self._cartId)")
        print("Product ID: \(String(describing: self._productId.productId)) - \(String(describing: self._productId.productName))")
        print("Quantity: \(String(describing: self._quantity))")
        print("Date Added: \(self._dateAdded.DateFormat())")
        
        
        
    }
}
