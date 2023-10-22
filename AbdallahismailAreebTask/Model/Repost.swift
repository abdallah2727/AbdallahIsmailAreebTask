//
//  ReposModel.swift
//  AbdallahismailAreebTask
//
//  Created by Abdallah ismail on 21/10/2023.
//

import Foundation
struct reposResult:Decodable {
    var Repost : [Repos]?
}
struct Repos:Decodable {
    
    var name : String?
    var full_name :String?
//    var owner : [owners]?
//    var url : String?
    
    
    
    
}
struct owners:Decodable {
    
    var login : String?
    var avatar_url : String?
    
    
}
