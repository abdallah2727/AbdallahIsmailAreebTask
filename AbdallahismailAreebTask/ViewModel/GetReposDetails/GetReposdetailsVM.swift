//
//  GetReposdetailsVM.swift
//  AbdallahismailAreebTask
//
//  Created by Abdallah ismail on 22/10/2023.
//

import Foundation
class GetReposdetailsVM {
    var repossUrl : String?
    var bindingObj : (()->()) = {}
    
    var reposResults :ReposDetiles?{
        didSet{
            bindingObj()
        }
    }
}
extension GetReposdetailsVM :getDetailsProtocol
{
    func getDetail() {
        RepoDetailNetworkService.repositryfetchData(url:repossUrl, handlerComplition: { result in
            self.reposResults =  result

        })
    
    }
    
    
    
    
}
