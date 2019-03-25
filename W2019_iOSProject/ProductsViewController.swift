//
//  ProductsViewController.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-22.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var customer : Customer = Customer()
    
    var products : [Product] = []
    
    @IBOutlet weak var tvProducts: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        tvProducts.delegate = self
        tvProducts.dataSource = self
        
        print("Customer from ProductsViewController - \(customer.custName)")
        
        products.append(Product(productId: 1, productName: "Stiches", Price: 10.0, author: "Mother Mother", year: 2008, mp3: "08 Bit By Bit", img: "mm.jpg"))
        
        products.append(Product(productId: 2, productName: "Guns&Roses", Price: 10.0, author: "Guns&Roses", year: 1985, mp3: "", img: "gunr3.jpg"))
        
        products.append(Product(productId: 3, productName: "Led Zepellin II", Price: 12.0, author: "Led Zepelin", year: 1976, mp3: "good times", img: "ledz2.jpg"))
        
        products.append(Product(productId: 4, productName: "The Resistance", Price: 12.0, author: "Muse", year: 2014, mp3: "", img: "muse2.jpg"))
        
        products.append(Product(productId: 5, productName: "Romance", Price: 9.0, author: "Rod Steward", year: 2014, mp3: "01 Rod", img: "rods.jpeg"))
        
         products.append(Product(productId: 6, productName: "Imagine", Price: 9.0, author: "Jhon Lenon", year: 1971, mp3: "05 I Dont", img: "ImagineComp.jpeg"))
        
        products.append(Product(productId: 7, productName: "John Denver definitive all-time GH", Price: 9.0, author: "John Denver", year: 1969, mp3: "06 Rocky Mountain High", img: "johndenver.jpg"))
        
        products.append(Product(productId: 8, productName: "Off The Ground", Price: 13.0, author: "Paul McCartney", year: 1990, mp3: "01 Off The Ground", img: "Off_the_Ground.jpg"))
        
        products.append(Product(productId: 9, productName: "Elvis 2nd to None", Price: 12.0, author: "Elvis Presley", year: 2012, mp3: "16 Little Sister", img: "elvis2nd.jpg"))
        
        for sc in customer.shoppingCart
        {
            print(sc.display())
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let productCell = tableView.dequeueReusableCell(withIdentifier: "productCell") as! ProductTableViewCell
        
        let product = self.products[indexPath.row]
        
        productCell.lblTitle.text = product.productName
        productCell.lblAuthor.text = product.author
        productCell.lblYear.text = "\(product.year)"
        
        productCell.imgCover.image = UIImage(named: product.imgCover)
        
        
        return productCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("Deselected :(",products[indexPath.row].author)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Selected :)",products[indexPath.row].author)
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let PrDetVC = sb.instantiateViewController(withIdentifier: "SB_ProductDetailAudio") as! ProductDetailAudioViewController
        PrDetVC.customer = customer
        PrDetVC.product = products[indexPath.row]
        
        self.present(PrDetVC, animated: true)
    }
    
    @IBAction func btnGoMenu(_ sender: UIBarButtonItem) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let MenuVC = sb.instantiateViewController(withIdentifier: "SB_Menu") as! MenuTableViewController
        
        MenuVC.customer = customer
        self.present(MenuVC, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
