//
//  eMailViewController.swift
//  W2019_iOSProject
//
//  Created by MacStudent on 2019-03-21.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import UIKit
import MessageUI


class eMailViewController: UIViewController, MFMailComposeViewControllerDelegate
{

    @IBOutlet weak var subjectText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func sendEmail(_ sender: UIBarButtonItem)
    {
        
        if MFMailComposeViewController.canSendMail()
        {
            
            print("Email Configured")
            let emailVC = MFMailComposeViewController()
            emailVC.mailComposeDelegate = self
           // emailVC.setToRecipients(["ag_musicrecords@gmail.com"])
            emailVC.setSubject(subjectText.text!)
            
            
            present(emailVC, animated: true, completion: nil)
        }
        else{
            print("No Email Configured")
        }
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
    {
        dismiss(animated: true, completion: nil)
    }

}







