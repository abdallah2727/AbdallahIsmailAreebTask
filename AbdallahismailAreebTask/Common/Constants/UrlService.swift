//
//  UrlService.swift
//  AbdallahismailAreebTask
//
//  Created by Abdallah ismail on 21/10/2023.
//

import Foundation
struct UrlService {
static var baseUrl = "https://api.github.com/"
    
    
    static func repostries() -> String {
        return baseUrl + "repositories"
    }
    
    static func detulRepostries(owner:String,repoName:String) -> String {
        return baseUrl + "repos" + "/"  + owner + "/" + repoName
    }

}
