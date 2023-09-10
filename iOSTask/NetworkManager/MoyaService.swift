//
//  MoyaService.swift
//  iOSTask
//
//  Created by Omar on 10/09/2023.
//

import Foundation
import Moya
enum MoyaService {
    case getUser(id:Int)
    case getAlbum(userId:Int)
    case getPhoto(AlbumId:Int)
}
extension MoyaService : TargetType{
    var baseURL: URL{
        return URL(string: APIConstant.BASE_URL)!
    }

    var path: String{
        switch self{

        case .getUser(id: let id):
            return "/users/\(id)"
        case .getAlbum:
            return "/Albums"
        case .getPhoto:
            return "/photos"
        }
    }

    var method: Moya.Method{
        switch self{

        case .getUser , .getAlbum , .getPhoto:
            return .get

        }
    }

    var task: Moya.Task{
        switch self{

        case .getUser :
            return .requestPlain

        case .getAlbum(userId: let userId):
            return .requestParameters(parameters: ["userId": userId], encoding: URLEncoding.default)
        case .getPhoto(AlbumId: let AlbumId):
            return .requestParameters(parameters: ["albumId": AlbumId], encoding: URLEncoding.default)
        }
    }

    var headers: [String : String]?{
        switch self{

        case .getUser ,.getAlbum , .getPhoto:
            return [:]

        }
    }


}
