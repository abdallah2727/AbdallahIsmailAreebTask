//
//  File.swift
//  AbdallahismailAreebTask
//
//  Created by Abdallah ismail on 21/10/2023.
//

import Foundation
class GetReposVM {
    var repossUrl : String?
    var bindingObj : (()->()) = {}
    
    var reposResults :[Repos]?{
        didSet{
            bindingObj()
        }
    }
}
extension GetReposVM :getReposProtocol
{
    func getRepos() {
        NetworkServices.repositryfetchData(url:repossUrl, handlerComplition: { result in
            self.reposResults =  result
        
        })
    
    }
    
    
    
    
}
