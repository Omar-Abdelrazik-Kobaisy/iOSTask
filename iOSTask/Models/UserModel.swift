//
//  UserModel.swift
//  iOSTask
//
//  Created by Omar on 11/09/2023.
//

import Foundation
struct UserModel : Decodable{
    let name : String?
    let address : Address
}

struct Address : Decodable{
    let street : String?
    let suite : String?
    let city : String?
    let zipcode : String?
}
