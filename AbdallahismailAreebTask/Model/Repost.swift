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
struct reposDetails:Decodable {
    var reposDet :ReposDetiles?
}
struct Repos:Decodable {
    var name : String?
    var full_name :String?
    var owner : owners?
}
struct owners:Decodable {
    
    var login : String?
    var avatar_url : String?
    
    
}
struct ReposDetiles:Decodable {
    var  created_at : String
    var updated_at : String
    var name : String?
    var full_name :String?
    var owner : owners?
}
