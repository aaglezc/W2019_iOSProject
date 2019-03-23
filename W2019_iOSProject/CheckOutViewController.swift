//
//  CheckOutViewController.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-22.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import UIKit

class CheckOutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var customerCO : Customer = Customer()
    var Item : ShoppingCart = ShoppingCart()
    var amount : Double = 0

    
    
    @IBOutlet weak var tvItems: UITableView!
    @IBOutlet weak var lblItems: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tvItems.delegate = self
        tvItems.dataSource = self
        
        lblItems.text = "Total Items :\(customerCO.shoppingCart.count)"
      
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customerCO.shoppingCart.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productCell = tableView.dequeueReusableCell(withIdentifier: "CheckOutCell") as! CheckOutTableViewCell
        
         Item = self.customerCO.shoppingCart[indexPath.row]

        productCell.lblId.text = "\(Item.cartId)"
        productCell.lblName.text = "\(Item.productId.productName)"
        productCell.lblQty.text = "\(Item.quantity)"
        let tot = Double(Item.quantity)*Item.productId.Price
        print(tot)
        productCell.lblTot.text = "$ \(tot)"
        

        return productCell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete
        {
            //let user = userArray[indexPath.row]
            customerCO.shoppingCart.remove(at: indexPath.row)
            self.lblItems.text = "Total Items: \(customerCO.shoppingCart.count)"
           
            
        }
        tableView.reloadData()
        
    }
    
    
    
    
    @IBAction func btnGoMenu(_ sender: UIBarButtonItem) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let MenuVC = sb.instantiateViewController(withIdentifier: "SB_Menu") as! MenuTableViewController
        
        MenuVC.customer = customerCO
        self.present(MenuVC, animated: true)
    }
    
    @IBAction func btnPlaceOder(_ sender: UIButton) {
        
        self.customerCO.checkOut()
        
        for o in customerCO.orders
        {
            var gt: Float = 0.0
            for od in o.orderDetalis
            {
                od.display()
            }
            //10.- customer place the order for shipping
            o.placeOrder()
            gt = o.CalcGrandTotal()
            print("\n**************************************************")
            print("Order Grand Total : \(gt.currencyformat())")
            print("**************************************************")
            o.shippingInfo.display()
        }
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let PlaceOrderVC = sb.instantiateViewController(withIdentifier: "SB_PlaceOrder") as! PlaceOrderViewController
        PlaceOrderVC.customerPO = customerCO

        self.present(PlaceOrderVC, animated: true)

    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
         */
    
    

}
