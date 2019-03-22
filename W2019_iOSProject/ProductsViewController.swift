//
//  ProductsViewController.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-22.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
  
    var products : [Product] = []

    @IBOutlet weak var tvProducts: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tvProducts.delegate = self
        tvProducts.dataSource = self
        
        products.append(Product(productId: 1, productName: "Stiches", Price: 10.0, author: "Mother Mother", year: 2008, mp3: "", img: "mm.jpg"))
        products.append(Product(productId: 2, productName: "Guns&Roses", Price: 10.0, author: "Guns&Roses", year: 1985, mp3: "", img: "gunsr.jpg"))
        products.append(Product(productId: 3, productName: "Led Zepellin II", Price: 12.0, author: "Led Zepelin", year: 1976, mp3: "", img: "ledz.jpg"))
        products.append(Product(productId: 4, productName: "Madness", Price: 12.0, author: "Muse", year: 2014, mp3: "", img: "muse.jpg"))
        products.append(Product(productId: 5, productName: "Romance", Price: 9.0, author: "Rod Steward", year: 2014, mp3: "", img: "rods.jpeg"))

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
