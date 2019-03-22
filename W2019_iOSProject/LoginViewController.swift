//
//  ViewController.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-21.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var txtMail: UITextField!
    @IBOutlet weak var txtPwd: UITextField!
    @IBOutlet weak var swRemember: UISwitch!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Saving user defaults variables
        
        let RememberDefault = UserDefaults.standard
        
        
        if let email = RememberDefault.string(forKey: "email")
        {
            
            txtMail.text = email
            
            if let pwd   = RememberDefault.string(forKey: "pwd")
            {
                txtPwd.text = pwd
            }
            swRemember.isOn = true
            
        }
        else
        {
            swRemember.isOn = false
        }
        
    }
    
    @IBAction func btnLogIn(_ sender: UIButton)
    {
        let email = txtMail.text
        let pwd   = txtPwd.text
        
        if email == "admin@123.com"
        {
            if pwd == "123"
            {
                if swRemember.isOn == true
                {
                // Save data using user defaults
                let RememberUD = UserDefaults.standard
                if swRemember.isOn == true
                {
                    RememberUD.set(email, forKey: "email")
                    RememberUD.set(pwd, forKey: "pwd")
                }
                else
                {
                    RememberUD.removeObject(forKey: "email")
                    RememberUD.removeObject(forKey: "pwd")
                }
                // Redirecting to the other ViewController
                let sb = UIStoryboard(name: "Main", bundle: nil)
                let menuVC = sb.instantiateViewController(withIdentifier: "SB_Menu") as! MenuTableViewController
                self.present(menuVC, animated: true)
                
            }
            
        }
    }
            
        else
        {
            print("User e-mail is not registered in the system.")
            
            let alert = UIAlertController(title: "Invalid", message: "Email or Password is wrong. Please Try Again!", preferredStyle: .alert)
            
            let addMessage = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(addMessage)
            self.present(alert, animated: true, completion: nil)
            
            
            
         /*   if swRemember.isOn == false
            {
                
            }*/
        }
        
        
    }
    


}

