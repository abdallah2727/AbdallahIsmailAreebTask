//
//  RepoDetailsViewController.swift
//  AbdallahismailAreebTask
//
//  Created by Abdallah ismail on 22/10/2023.
//

import UIKit

class RepoDetailsViewController: UIViewController {
    var ownerName :String?
    var repoName:String?
    var reposModel: GetReposdetailsVM?
    var reposs :ReposDetiles?
    var repositries :ReposDetiles?
    
    @IBOutlet weak var repoNameLbl: UILabel!
    @IBOutlet weak var ownerNameLbl: UILabel!
    @IBOutlet weak var ownerImage: UIImageView!
  
    @IBOutlet weak var creationDate: UILabel!
    override func viewDidLoad() {
        reposModel = GetReposdetailsVM()
        reposModel?.repossUrl = UrlService.detulRepostries(owner: ownerName ?? "no owner name", repoName: repoName ?? "no repo name")
        reposModel?.getDetail()
        reposModel?.bindingObj = {()in
            self.renderRepos()
        }
   
        super.viewDidLoad()
    }
  

}
extension RepoDetailsViewController {
    func renderRepos(){
        DispatchQueue.main.async { [self] in
            
            self.reposs = self.reposModel?.reposResults
            self.repositries = self.reposs
            self.updateUi(ownerNam: repositries?.owner?.login ?? "no name", repoNames: repositries?.name ?? "no name", imageUrl: repositries?.owner?.avatar_url ?? "url" , creationdate:repositries?.created_at ?? "no date")
        
            
        }
        
    }
    
    
}
extension RepoDetailsViewController {
    func updateUi(ownerNam:String,repoNames:String,imageUrl:String,creationdate:String)
    {
        ownerNameLbl.text = ownerNam
        repoNameLbl.text = repoNames
        creationDate.text = creationdate
        ownerImage.kf.setImage(with:URL( string: imageUrl))
        
    }
    
    
    
}
