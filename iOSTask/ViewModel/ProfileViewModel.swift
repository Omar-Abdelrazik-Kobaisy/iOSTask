//
//  ProfileViewModel.swift
//  iOSTask
//
//  Created by Omar on 11/09/2023.
//

import Foundation
import Moya
import RxMoya
import RxSwift

class ProfileViewModel{
    var userResponse = PublishSubject<UserModel>()
    var albumResponse = PublishSubject<[AlbumModel]>()
    let api : Contract
    private var bag = DisposeBag()
    init(api: Contract = NetworkServices()) {
        self.api = api
    }
    
    func getUser(id : Int){
        api.fetchData(target: .getUser(id: id), responseClass: UserModel.self, completion: { [weak self] response in
            self?.userResponse.onNext(response!)
        })
    }
    func getAlbums(forUserId id:Int){
        api.fetchData(target: .getAlbum(userId: id), responseClass: [AlbumModel].self, completion: { [weak self] response in
            self?.albumResponse.onNext(response!)
        })
    }
}
