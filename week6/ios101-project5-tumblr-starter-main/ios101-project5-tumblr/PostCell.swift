//
//  PostCell.swift
//  ios101-project5-tumblr
//
//  Created by Hoonsun Lee on 4/2/25.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var overviewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
