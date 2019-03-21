//
//  Products.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-21.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import Foundation

class Product : IDisplay
{
    private var _productId: Int
    private var _productName:String
    private var _price: Double
    
    var ProductId: Int
    {
        get {
            return _productId
        }
        set{
            _productId = newValue
        }
    }
    
    var ProductName: String
    {
        get
        {
            return _productName
        }
        set
        {
            _productName = newValue
        }
    }
    var Price: Double
    {
        get
        {
            return _price
        }
        set
        {
            _price = newValue
        }
    }
    
    
    init()
    {
        self._productId = 0
        self._productName = String()
        self._price = Double()
    }
    
    
    init(productId: Int, productName: String, Price: Double)
    {
        self._productId = productId
        self._productName = productName
        self._price = Price
        
    }
    
    func display()
    {
        print("Product Id: ",self._productId,"\nProduct Name: ",self._productName,"\nProduct Price: ",self._price )
        print("*****************************")
    }
}
