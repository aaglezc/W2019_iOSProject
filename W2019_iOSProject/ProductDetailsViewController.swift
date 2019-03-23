//
//  ProductDetailsViewController.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-22.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    var customer : Customer = Customer()
    var product : Product = Product()
    
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        print("Customer from ProductDtails - \(customer.custName)")
        print("Product Selected  - \(product.productName)")
        
        self.imgCover.image = UIImage(named: product.imgCover)
        self.lblTitle.text  = "Title : \(product.productName)"
        self.lblAuthor.text = "Autor : \(product.author)"
        self.lblYear.text   = "Year  : \(product.year)"
        self.lblPrice.text  = "Price : $\(product.Price) CAD"
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
