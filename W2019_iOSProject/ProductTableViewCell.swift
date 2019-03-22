//
//  ProductTableViewCell.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-22.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

   @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblYear: UILabel!
   @IBOutlet weak var imgCover: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
