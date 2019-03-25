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
    private var _author : String
    private var _year : Int16
    private var _imgCover : String
    private var _mp3: String
    private var _genero : Genero?
    
    var productId: Int
    {
        get {
            return _productId
        }
        set{
            _productId = newValue
        }
    }
    
    var productName: String
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
    var author: String
    {
        get
        {
            return _author
        }
        set
        {
            _author = newValue
        }
    }
    var year: Int16
    {
        get
        {
            return _year
        }
        set
        {
            _year = newValue
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
    var imgCover : String
    {
        get
        {
            return _imgCover
        }
        set
        {
            _imgCover = newValue
        }
    }
    
    var mp3 : String
    {
        get
        {
            return _mp3
        }
        set
        {
            _mp3 = newValue
        }
    }
    
    init()
    {
        self._productId = 0
        self._productName = String()
        self._price = Double()
        self._author = String()
        self._year = 0
        self._mp3 = String()
        self._imgCover = String()
        
    }
    
    
    init(productId: Int, productName: String, Price: Double, author : String, year: Int16, mp3 : String, img :String)
    {
        self._productId = productId
        self._productName = productName
        self._price = Price
        self._author = author
        self._year = year
        self._imgCover = img
        self._mp3 = mp3
    }
    
    func display()
    {
        print("Product Id: ",self._productId,"\nProduct Name: ",self._productName,"\nProduct Price: ",self._price )
        print("*****************************")
    }
}
