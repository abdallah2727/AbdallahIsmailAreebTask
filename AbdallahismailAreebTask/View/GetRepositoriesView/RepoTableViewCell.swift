//
//  RepoTableViewCell.swift
//  AbdallahismailAreebTask
//
//  Created by Abdallah ismail on 20/10/2023.
//

import UIKit
import Kingfisher
class RepoTableViewCell: UITableViewCell {

    @IBOutlet weak var ownerImage: UIImageView!
    
    @IBOutlet weak var ownerName: UILabel!
    
    @IBOutlet weak var repoName: UILabel!


}

extension RepoTableViewCell {
    func setcell (ownerNamee:String,repoNamee:String,ownerImagee:String)
    {
        ownerName.text = ownerNamee
        repoName.text = repoNamee
        ownerImage.layer.cornerRadius = self.ownerImage.frame.size.width / 2
        ownerImage.clipsToBounds = true

        ownerImage.layer.borderColor = UIColor.white.cgColor

        ownerImage.layer.borderWidth = 1
        ownerImage.kf.setImage(with:URL( string: ownerImagee))
        
    }
    
}
