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

    @IBOutlet weak var tvOrder: UITableView!
    
    @IBOutlet weak var lblTot: UILabel!
    @IBOutlet weak var lblGTot: UILabel!
    @IBOutlet weak var lblItems: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tvOrder.delegate = self
        tvOrder.dataSource = self
        
        for o in customerPO.orders
        {
            var gt: Float = 0.0
            for od in o.orderDetalis
            {
                od.display()
            }
            //10.- customer place the order for shipping
            gt = o.CalcGrandTotal()
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
         productCell.lblQty.text = "$ \(Item.unitCost)"
        productCell.lblQty.text = "\(Item.quantity)"
        productCell.lblTot.text = "$ \(Item.subTotal)"
        
        //self.lblAmount.text = "Total Amount : \(self.amount)"
        
        return productCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
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
