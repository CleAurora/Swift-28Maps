//
//  LocationViewCell.swift
//  MapsPins
//
//  Created by Cleís Aurora Pereira on 06/11/20.
//

import UIKit

class LocationViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var typeLabel: UILabel!

    func setup(location: Location){
        nameLabel.text = location.name
        typeLabel.text = location.type
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
