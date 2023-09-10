//
//  ProfileViewController.swift
//  iOSTask
//
//  Created by Omar on 10/09/2023.
//

import UIKit
import RxSwift
import RxCocoa
class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var userName: UILabel!
    
    
    @IBOutlet weak var userAddress: UILabel!
    
    
    @IBOutlet weak var albumsTableView: UITableView!
    
    private var viewModel = ProfileViewModel()
    var bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        let randomNumber = Int.random(in: 1 ... 10 )
        albumsTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "item")
        title = "Profile"
        viewModel.getUser(id: randomNumber)
        viewModel.getAlbums(forUserId: randomNumber)
        viewModel.userResponse.subscribe({[weak self] user in
            guard let self = self else{return}
            self.userName.text = user.element?.name
            var address:Address = Address(street: "", suite: "", city: "", zipcode: "")
            address = user.element?.address ?? Address(street: "", suite: "", city: "", zipcode: "")
            self.userAddress.text = (address.street ?? "") + (address.suite ?? "") + (address.city ?? "") + (address.zipcode ?? "")
        }
        ).disposed(by: bag)
        bindDataToTableView()
        
    }

    private func bindDataToTableView(){
        viewModel.albumResponse.bind(to: albumsTableView.rx.items(cellIdentifier: "item",cellType: TableViewCell.self)){row,item,cell in
            cell.title.text = item.title
        }.disposed(by: bag)
        
        albumsTableView.rx.modelSelected(AlbumModel.self).bind{ album in
            let photosViewController = PhotosViewController(nibName: "PhotosViewController", bundle: nil)
            photosViewController.albumId = album.id
            self.navigationController?.pushViewController(photosViewController, animated: true)
            
        }.disposed(by: bag)
    }

}
