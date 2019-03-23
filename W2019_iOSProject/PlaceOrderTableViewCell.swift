//
//  PlaceOrderTableViewCell.swift
//  W2019_iOSProject
//
//  Created by Art Fred Glez on 2019-03-23.
//  Copyright © 2019 Art Fred Glez. All rights reserved.
//

import UIKit

class PlaceOrderTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblID: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblQty: UILabel!
    @IBOutlet weak var lblTot: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
