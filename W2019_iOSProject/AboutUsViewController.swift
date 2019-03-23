//
//  AboutUsViewController.swift
//  W2019_iOSProject
//
//  Created by MacStudent on 2019-03-21.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import UIKit
import WebKit


class AboutUsViewController: UIViewController, WKNavigationDelegate {

    
    
    @IBOutlet weak var wvAbout: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let localFilePath = Bundle.main.url(forResource: "about", withExtension: "htm")
        let myRequest = URLRequest(url: localFilePath!)
        wvAbout.load(myRequest)
        
      
        // Do any additional setup after loading the view.
    }
    
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
