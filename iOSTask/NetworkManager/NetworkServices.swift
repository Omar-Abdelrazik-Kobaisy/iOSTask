//
//  NetworkServices.swift
//  iOSTask
//
//  Created by Omar on 10/09/2023.
//

import Foundation
import Foundation
import Moya
import RxMoya
import RxSwift
protocol Contract{
    func fetchData<T: Decodable>(target : MoyaService,responseClass : T.Type , completion : @escaping(T?)->Void)
}
class NetworkServices : Contract{
    var provider = MoyaProvider<MoyaService>(plugins: [NetworkLoggerPlugin()])
    func fetchData<T: Decodable>(target : MoyaService ,responseClass : T.Type ,completion : @escaping(T?)->Void){
        
        provider.request(target) { result in
            switch result {
            case let .success(response):
                let result = try? JSONDecoder().decode( T.self, from: response.data)
                completion(result)
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
