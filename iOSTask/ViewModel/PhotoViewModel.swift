//
//  PhotoViewModel.swift
//  iOSTask
//
//  Created by Omar on 11/09/2023.
//

import Foundation
import Moya
import RxMoya
import RxSwift
import RxRelay

class PhotoViewModel{
    var photoResponse = PublishSubject<[PhotoModel]>()
    var searchBehavior = BehaviorRelay<String>(value : "")
    var searchArr = [PhotoModel]()
    private var bag = DisposeBag()
    let api : Contract
    init(api: Contract = NetworkServices()) {
        self.api = api
    }
    func getPhotos(albumId : Int){
        api.fetchData(target: .getPhoto(AlbumId: albumId), responseClass: [PhotoModel].self) {[weak self] response in
            guard let response = response else {return}
            self?.photoResponse.onNext(response)
            self?.searchArr = response
        }
    }
    func search(){
        
            let dataSearch = searchArr.filter({ $0.title?.contains((searchBehavior.value)) == true })
            photoResponse.onNext(dataSearch)
        
        
    }
}
