//
//  getRepositryProtocol.swift
//  AbdallahismailAreebTask
//
//  Created by Abdallah ismail on 21/10/2023.
//

import Foundation
protocol RepositryProtocol{
    static func repositryfetchData(url : String?,handlerComplition : @escaping ([Repos]?)->Void)
   
}
