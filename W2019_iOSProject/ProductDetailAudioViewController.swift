//
//  ProductDetailAudioViewController.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-24.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import UIKit
import AVFoundation

class  ProductDetailAudioViewController: UIViewController , AVAudioPlayerDelegate
{
    
    var customer : Customer = Customer()
    var product : Product = Product()
    
    //@IBOutlet weak var soundProgressBar: UIProgressView!
    var player : AVAudioPlayer! //= AVAudioPlayer()
    
    
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    @IBOutlet weak var lblMsg: UILabel!
    
    @IBOutlet weak var lblActivy: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("Customer from ProductDtails - \(customer.custName)")
        print("Product Selected  - \(product.productName)")
        
        self.imgCover.image = UIImage(named: product.imgCover)
        self.lblTitle.text  = "Title : \(product.productName)"
        self.lblAuthor.text = "Autor : \(product.author)"
        self.lblYear.text   = "Year  : \(product.year)"
        self.lblPrice.text  = "Price : $\(product.Price) CAD"
        
        
        
    }

        
    @IBAction func btnPlay(_ sender: UIButton) {
        
        do
        {
            let song = product.mp3
            let audioPath = Bundle.main.path(forResource: song, ofType: "m4a")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
            //
        }
        player.play()
        lblActivy.startAnimating()
    }
    
    @IBAction func btnStop(_ sender: UIButton) {
        
        if player != nil {
            player.stop()
            player = nil
            lblActivy.stopAnimating()
        }
    }
    

    @IBAction func ChangeVol(_ sender: UISlider) {
        
        if player != nil
        {
            player.volume = sender.value
        }
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        
        let cartItem = ShoppingCart(cartId: customer.shoppingCart.count+1, productId: product, quantity: 1, dateAdded: Date())
        
        cartItem.addCartItem(customer: customer)
        
        lblMsg.text = "Item added to Cart"
        
        
        
        
    }
    
    @IBAction func BtnGoRecords(_ sender: UIBarButtonItem) {
        
        if player != nil {
            player.stop()
            player = nil
            lblActivy.stopAnimating()
        }
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let RecVC = sb.instantiateViewController(withIdentifier: "SB_Products") as! ProductsViewController
        
        RecVC.customer = customer
        self.present(RecVC, animated: true)
        
        
    }
    
    
    @IBAction func BtnGoMenu(_ sender: UIBarButtonItem) {
        
        if player != nil {
            player.stop()
            player = nil
            lblActivy.stopAnimating()
        }
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let MenuVC = sb.instantiateViewController(withIdentifier: "SB_Menu") as! MenuTableViewController
        
        MenuVC.customer = customer
        self.present(MenuVC, animated: true)
    }
    
    
    
    
}
