//
//  MySkiResortCell.swift
//  EpicvsIkon
//
//  Created by Jason Sanchez on 9/17/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit

class MySkiResortCell: UITableViewCell {

    @IBOutlet weak var resortImageView: UIImageView!
    @IBOutlet weak var resortLabel: UILabel!
    @IBOutlet weak var passType: UILabel!
    @IBOutlet weak var trueSnowLabel: UILabel!
    @IBOutlet weak var daysToPaybackLabel: UILabel!
    @IBOutlet weak var verticalDropLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    func configureCell(resort: Resort) {
        resortLabel.text = resort.name
        passType.text = resort.passType
        trueSnowLabel.text = String(resort.trueSnowFall)
        daysToPaybackLabel.text = String(resort.daysToPayBack)
        verticalDropLabel.text = String(resort.verticalDrop)
        
        if let imageData = resort.imageLogo as Data? {
            resortImageView.image = UIImage(data: imageData)
            resortImageView.layer.borderWidth = 0.5
            resortImageView.layer.cornerRadius = 4
        }
    }
}
