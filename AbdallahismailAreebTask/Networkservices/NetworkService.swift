//
//  NetworkService.swift
//  AbdallahismailAreebTask
//
//  Created by Abdallah ismail on 21/10/2023.
//

import Foundation
import Alamofire
class NetworkServices:RepositryProtocol{
    
static func repositryfetchData(url : String?,handlerComplition : @escaping ([Repos]?)->Void) {
AF.request("\(url!)").responseData {response in
            guard let data = response.data else {
                return
            }
            
            do{
                let result = try JSONDecoder().decode([Repos].self, from: data)
                handlerComplition(result)
             
            }catch let error {
                print(error.localizedDescription)
                handlerComplition(nil)
                print(String(describing: error))
              
            }
            
          }
      }
    
}
