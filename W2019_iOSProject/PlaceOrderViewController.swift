//
//  PlaceOrderViewController.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-23.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var customerPO : Customer = Customer()
    var gT : Float = 0

    @IBOutlet weak var tvOrder: UITableView!
    
    @IBOutlet weak var lblTot: UILabel!
    @IBOutlet weak var lblGTot: UILabel!
    @IBOutlet weak var lblItems: UILabel!
    @IBOutlet weak var lblMsg: UILabel!
    
    
    @IBOutlet weak var btnPlaceOrder: UIBarButtonItem!
    @IBOutlet weak var btnCancel: UIBarButtonItem!
    
    
    @IBOutlet weak var txtType: UITextField!
    @IBOutlet weak var txtRegion: UITextField!
    @IBOutlet weak var txtCost: UITextField!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tvOrder.delegate = self
        tvOrder.dataSource = self
        
        
        self.lblName.text = customerPO.custName
        self.lblAddress.text = customerPO.address
        
        
        
        
        for o in customerPO.orders
        {
            var gt: Float = 0.0
            for od in o.orderDetalis
            {
                od.display()
            }
            //10.- customer place the order for shipping
            gt = o.CalcGrandTotal()
            self.gT = gt
            print("\n**************************************************")
            print("Order Grand Total : \(gt.currencyformat())")
            print("**************************************************")
            o.shippingInfo.display()
            self.lblTot.text = "Total: CAD $\(gt)"
            self.lblItems.text = "Total Items: \(self.customerPO.orders[0].orderDetalis.count)"
        }

        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.customerPO.orders[0].orderDetalis.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let productCell = tableView.dequeueReusableCell(withIdentifier: "productCell") as! PlaceOrderTableViewCell
        
      
        let Item = self.customerPO.orders[0].orderDetalis[indexPath.row]
        
        productCell.lblID.text = "\(indexPath.row+1)"
        productCell.lblName.text = "\(Item.productName)"
         productCell.lblPrice.text = "$ \(Item.unitCost)"
        productCell.lblQty.text = "\(Item.quantity)"
        productCell.lblTot.text = "$ \(Item.subTotal)"
        
        //self.lblAmount.text = "Total Amount : \(self.amount)"
        
        return productCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }

    @IBAction func btnConfirm(_ sender: UIBarButtonItem) {
        
        let cred = customerPO.creditCardInfo
        let sType = self.txtType.text
        let sRegion = self.txtRegion.text
        let sCost = self.txtCost.text
        
        
        if (sType!.isEmpty) || sRegion!.isEmpty  || sCost!.isEmpty
        {
            print("Empy boxes")
            let alert = UIAlertController(title: "Invalid", message: "Please fill all the requiered fields *", preferredStyle: .alert)
            
            let addMessage = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(addMessage)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if cred.isEmpty
        {
            print("Empy boxes")
            let alert = UIAlertController(title: "Invalid", message: "You nedd to register a valid Credit Card Number to complete the Order, Please update you profile.", preferredStyle: .alert)
            
            let addMessage = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(addMessage)
            self.present(alert, animated: true, completion: nil)
            return
            
        }
        
        let gTot = self.gT + Float(sCost!)!
        self.lblGTot.text = "Order Cost : CAD $\(gTot)"
        
        self.lblMsg.text = "Order Complted"
        
        let alert = UIAlertController(title: "Invalid", message: "Orer has successfully completed, thank for buying in our app!!", preferredStyle: .alert)
        
        let addMessage = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(addMessage)
        self.present(alert, animated: true, completion: nil)
        return
        
        
        
        self.btnPlaceOrder.isEnabled = false
        
        
        self.txtRegion.isEnabled = false
        self.txtCost.isEnabled = false
        self.txtType.isEnabled = false
        
        self.btnCancel.title = "Menu"
        
        self.customerPO.display()
        
        
        
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
