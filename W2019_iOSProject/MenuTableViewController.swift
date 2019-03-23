//
//  MenuViewController.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-21.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController  {

    var customer : Customer = Customer()
    
    
    @IBOutlet weak var BtnUser: UIBarButtonItem!
    
    @IBOutlet weak var btnCart: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("-MenuView-")

        print(customer.custName)
        
        for sc in customer.shoppingCart
        {
            print(sc.display())
        }
        // Do any additional setup after loading the view.
        BtnUser.title = customer.custName
        btnCart.title = "Cart (\(customer.shoppingCart.count))"
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0
        {
            switch indexPath.row {
            case 0:
                print("Menu Item - Home")
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let homeVC = sb.instantiateViewController(withIdentifier: "SB_Home") as! HomeViewController
                self.present(homeVC, animated: true)
            case 1:
                print("Menu Item - Records")
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let RecVC = sb.instantiateViewController(withIdentifier: "SB_Products") as! ProductsViewController
                self.present(RecVC, animated: true)
                
            case 2:
                print("Menu Item - Check Out")
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let CheckVC = sb.instantiateViewController(withIdentifier: "SB_CheckOut") as! CheckOutViewController
                CheckVC.customerCO = self.customer
                self.present(CheckVC, animated: true)
                
            default:
                print("Invalid Option")
            }
        }else{
            switch indexPath.row {
            case 0:
                print("Menu Item - Contact")
               
                let sb1 = UIStoryboard(name: "Main", bundle: nil)
                let contactVC = sb1.instantiateViewController(withIdentifier: "SB_Contact") as! ContactViewController
                self.present(contactVC, animated: true)
            case 1:
                print("Menu Item - About Us")
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let aboutVC = sb.instantiateViewController(withIdentifier: "SB_AboutUs") as! AboutUsViewController
                self.present(aboutVC, animated: true)
            case 2:
                print("Menu Item - Log Out")
            default:
                print("Invalid Option")
            }
        }
    }

    @IBAction func btnCartCheckOut(_ sender: UIBarButtonItem) {
        
        
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

