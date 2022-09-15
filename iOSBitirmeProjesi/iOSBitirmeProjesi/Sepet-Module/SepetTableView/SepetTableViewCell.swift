//
//  SepetTableViewCell.swift
//  iOSBitirmeProjesi
//
//  Created by Aykut ATABAY on 13.09.2022.
//

import UIKit

class SepetCell: UITableViewCell {
    
    @IBOutlet weak var sepetImage: UIImageView!
    
    @IBOutlet weak var labelYemekAd: UILabel!
    @IBOutlet weak var labelYemekAdet: UILabel!
    
    @IBOutlet weak var labelYemekFiyat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
