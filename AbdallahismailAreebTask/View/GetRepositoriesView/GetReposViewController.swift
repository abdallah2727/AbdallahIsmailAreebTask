//
//  ViewController.swift
//  AbdallahismailAreebTask
//
//  Created by Abdallah ismail on 20/10/2023.
//

import UIKit

class GetReposViewController: UIViewController {
    @IBOutlet weak var reposTableView: UITableView!
//  #vars in GetReposViewController
    var reposModel: GetReposVM?
    var reposs :[Repos] = []
    var reposForPage = 10
    var limit:Int?
    var paginatedRepos :[Repos] = []
    
override func viewDidLoad() {
        super.viewDidLoad()
      
        self.reposTableView.tableFooterView = self.createLoadingFooter()
        reposTableView.delegate = self
        reposTableView.dataSource = self
        reposModel = GetReposVM()
        reposModel?.repossUrl = UrlService.repostries()
        reposModel?.getRepos()
        reposModel?.bindingObj = {()in
            self.reposTableView.tableFooterView = self.createLoadingFooter()
            self.renderRepos()
            
            
        }

    }
  

}


extension GetReposViewController:UITableViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
   
        if scrollView==reposTableView {
            self.reposTableView.tableFooterView = createLoadingFooter()
            if (scrollView.contentOffset.y + scrollView.frame.size.height)
            >= (scrollView.contentSize.height) {
             
                getPaginatedRepos(reposForPage: reposForPage)
          
         
            }
       
        }
        self.reposTableView.tableFooterView = nil
       }
    
}
extension GetReposViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paginatedRepos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:RepoTableViewCell = tableView.dequeueReusableCell(withIdentifier:"repoCell") as! RepoTableViewCell
        let cellRepo = self.paginatedRepos [indexPath.row]
        cell.setcell(ownerNamee: cellRepo.owner?.login ?? "no name", repoNamee: cellRepo.name ?? "no name", ownerImagee: cellRepo.owner?.avatar_url ?? "url")
        return cell
       
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detiledRepos = self.storyboard!.instantiateViewController(withIdentifier: "detailedRepoInfo") as! RepoDetailsViewController
        self.navigationController?.pushViewController(detiledRepos, animated: true)
        let cellRepo = self.paginatedRepos [indexPath.row]
        detiledRepos.ownerName = cellRepo.owner?.login
        detiledRepos.repoName = cellRepo.name
    }
    
    
    
}
extension GetReposViewController {
    func renderRepos() {
        
        DispatchQueue.main.async {

            self.reposs = self.reposModel?.reposResults ?? []
            self.reposTableView.tableFooterView = nil
            self.reposTableView.tableFooterView = self.createLoadingFooter()
            self.limit = self.reposs.count
            for i in 0..<10 {
                self.paginatedRepos.append(self.reposs[i])
                
            }
  
            self.reposTableView.reloadData()
 
        
        }
        DispatchQueue.main.async {
            self.reposTableView.tableFooterView = nil
        }
        DispatchQueue.main.async {
            
            self.reposTableView.reloadData()
        }

        
    }
}
extension GetReposViewController {
    func getPaginatedRepos (reposForPage:Int)
    {
        self.reposTableView.tableFooterView = nil
        if reposForPage >= limit ?? 10{
            self.reposTableView.tableFooterView = self.createLoadingFooter()
            return
        }
        else if reposForPage >= limit ?? 10 - 10 {
            
            for i in reposForPage..<(limit ?? 10)
            {
                self.reposTableView.tableFooterView = createLoadingFooter()
                paginatedRepos.append(reposs[i])
            
                
            }
            self.reposForPage += 10
        }
        else {
            self.reposTableView.tableFooterView = createLoadingFooter()
            for i in reposForPage ..< reposForPage+10 {
                paginatedRepos.append(reposs[i])
               
               
            }
            self.reposForPage += 10
           
          
        }
                    self.reposTableView.tableFooterView = createLoadingFooter()
        DispatchQueue.main.async {
            self.reposTableView.tableFooterView = self.createLoadingFooter()
            self.reposTableView.reloadData()
     
          
        }
       
    }
    
}
extension GetReposViewController {
    func createLoadingFooter() -> UIView {
        let footerview = UIView (frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let loadingSpinner = UIActivityIndicatorView()
        loadingSpinner.center = footerview.center
        footerview.addSubview(loadingSpinner)
        loadingSpinner.startAnimating()
        return footerview
    }

}
