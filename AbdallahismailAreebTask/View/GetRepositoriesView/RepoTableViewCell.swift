//
//  RepoTableViewCell.swift
//  AbdallahismailAreebTask
//
//  Created by Abdallah ismail on 20/10/2023.
//

import UIKit

class RepoTableViewCell: UITableViewCell {

    @IBOutlet weak var ownerImage: UIImageView!
    
    @IBOutlet weak var ownerName: UILabel!
    
    @IBOutlet weak var repoName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
