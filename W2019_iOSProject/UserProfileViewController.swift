//
//  UserProfileViewController.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-24.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {
    
     var customer : Customer = Customer()
    
    @IBOutlet weak var txtMail: UITextField!

    
    @IBOutlet weak var lblName: UITextField!
    

    
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCreditCard: UITextField!
    
    @IBOutlet weak var lblMsg: UILabel!
    
    @IBOutlet weak var btnUpdate: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.txtMail.text = self.customer.email
        self.lblName.text = self.customer.custName
        self.txtAddress.text = customer.address
        self.txtMail.text = customer.email
        self.txtCreditCard.text = customer.creditCardInfo
        
        
    }
    @IBAction func BtnUpdate(_ sender: UIBarButtonItem) {
        
        let email = self.txtMail.text
        let name = self.lblName.text
      
        let addr = self.txtAddress.text
        let cred = self.txtCreditCard.text
        
        if (email!.isEmpty) || addr!.isEmpty || cred!.isEmpty || name!.isEmpty
        {
            print("Empy boxes")
            let alert = UIAlertController(title: "Invalid", message: "Please fill all the requiered fields *", preferredStyle: .alert)
            
            let addMessage = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(addMessage)
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        if email!.count < 15
        {
            print("Student eMail must be >=15")
            let alert = UIAlertController(title: "Invalid", message: "Email must contain at leats 15 chracters. Please Try Again!", preferredStyle: .alert)
            
            let addMessage = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(addMessage)
            self.present(alert, animated: true, completion: nil)
            
            return
        }
        else
        {
            if email!.isValidEmail() == false
            {
                
                
                let alert = UIAlertController(title: "Invalid", message: "Email is wrong. Please Try Again!", preferredStyle: .alert)
                
                let addMessage = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alert.addAction(addMessage)
                self.present(alert, animated: true, completion: nil)
                
                print("Invalid Email ID")
                return
            }
            
        }
        if cred!.count != 18
        {
            print("Credit Card  must be = 18")
            let alert = UIAlertController(title: "Invalid", message: "Credit Card must contain 18 chracters XXXX-XXXX-XXXX-XXXX. Please Try Again!", preferredStyle: .alert)
            
            let addMessage = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(addMessage)
            self.present(alert, animated: true, completion: nil)
            
            return
            
        }
        
        self.customer.email = email!
        self.customer.address = addr!
        self.customer.custName = name!
        self.customer.creditCardInfo = cred!
        
        
        lblMsg.text = "Profile Updated"
        btnUpdate.isEnabled = false
        
        
        
    }
    
    @IBAction func BtnGoMenu(_ sender: UIBarButtonItem) {
        
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
