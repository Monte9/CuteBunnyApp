//
//  GifCell.swift
//  CuteBunnyApp
//
//  Created by Monte's Pro 13" on 2/17/16.
//  Copyright © 2016 MonteThakkar. All rights reserved.
//

import UIKit

class GifCell: UITableViewCell {

    @IBOutlet weak var gifID: UILabel!
    
    @IBOutlet weak var gifRating: UILabel!
    
    @IBOutlet weak var gifSlug: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
