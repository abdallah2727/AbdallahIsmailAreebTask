//
//  RepoDetailNetworkService.swift
//  AbdallahismailAreebTask
//
//  Created by Abdallah ismail on 22/10/2023.
//

import Foundation
import Alamofire
class RepoDetailNetworkService{
    
    
    static func repositryfetchData(url : String?,handlerComplition : @escaping (ReposDetiles?)->Void) {
        AF.request("\(url!)").responseData {response in
            guard let data = response.data else {
                return
            }
            
            do{
                let result = try JSONDecoder().decode(ReposDetiles.self, from: data)
                handlerComplition(result)
                
            }catch let error {
                print(error.localizedDescription)
                handlerComplition(nil)
                print(String(describing: error))
                
            }
            
        }
    }
}

