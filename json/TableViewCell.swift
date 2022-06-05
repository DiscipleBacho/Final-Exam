//
//  TableViewCell.swift
//  json
//
//  Created by Bachana Sanadiradze on 05.06.22.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var stock: UILabel!
    @IBOutlet weak var price: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
