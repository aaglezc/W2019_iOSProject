//
//  ProductDetailsViewController.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-22.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import UIKit
import AVFoundation

class ProductDetailsViewController: UIViewController, AVAudioPlayerDelegate {
    
    var customer : Customer = Customer()
    var product : Product = Product()
    
    
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblMsg: UILabel!
    
     var player : AVAudioPlayer! //= AVAudioPlayer()
    
  
    
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var soundProgressBar: UIProgressView!
    
    
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
    
    
    @IBAction func btnAdd(_ sender: UIButton) {
        
        let cartItem = ShoppingCart(cartId: customer.shoppingCart.count+1, productId: product, quantity: 1, dateAdded: Date())
        
        cartItem.addCartItem(customer: customer)
        
        lblMsg.text = "Item added"
        
        
        
    }
    
    @IBAction func btnBack(_ sender: UIBarButtonItem) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let RecVC = sb.instantiateViewController(withIdentifier: "SB_Products") as! ProductsViewController
        
        RecVC.customer = customer
        self.present(RecVC, animated: true)
        
    }
    
    
    @IBAction func btnGoMenu(_ sender: UIBarButtonItem) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let MenuVC = sb.instantiateViewController(withIdentifier: "SB_Menu") as! MenuTableViewController
        
        MenuVC.customer = customer
        self.present(MenuVC, animated: true)
    }
    
    @IBAction func Play(_ sender: UIButton) {
        do
        {
            let audioPath = Bundle.main.path(forResource: "08 Bit By Bit", ofType: "m4a")
            
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
            print(error)
        }
        player.play()
        
        
        
    }
    @IBAction func StopPlay(_ sender: UIButton) {
        
        if player != nil {
            player.stop()
            player = nil
        }
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
