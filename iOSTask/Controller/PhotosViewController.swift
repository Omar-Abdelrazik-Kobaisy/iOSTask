//
//  PhotosViewController.swift
//  iOSTask
//
//  Created by Omar on 11/09/2023.
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher
class PhotosViewController: UIViewController{
    
    
    let searchController = UISearchBar()
    let numberOfCellsPerRow: CGFloat = 3
    var albumId : Int?
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    private var viewModel = PhotoViewModel()
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getPhotos(albumId: albumId ?? 0)
        setupUI()
        bindDataToCollectionView()
        searchDataUsingSearchController()
    }

    private func setupUI(){
        navigationItem.titleView = searchController
        photosCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "item")
        if let flowLayout = photosCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let horizontalSpacing = flowLayout.scrollDirection == .vertical ? flowLayout.minimumInteritemSpacing : flowLayout.minimumLineSpacing
            let cellWidth = (view.frame.width - max(0, numberOfCellsPerRow - 1)*horizontalSpacing)/numberOfCellsPerRow
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
    }

    private func bindDataToCollectionView(){
        viewModel.photoResponse.bind(to: photosCollectionView.rx.items(cellIdentifier: "item",cellType: CollectionViewCell.self)){index,photo,cell in
            
            cell.imgView.kf.setImage(with: URL(string: photo.url ?? ""))
        }.disposed(by: bag)
    }
    private func searchDataUsingSearchController(){
        searchController.rx.text.orEmpty.bind(to: viewModel.searchBehavior).disposed(by: bag)
        searchController.rx.text.orEmpty.throttle(RxTimeInterval.microseconds(100), scheduler: MainScheduler.asyncInstance)
            .distinctUntilChanged()
            .subscribe (onNext: { [weak self]_ in
                if self?.searchController.text == "" {
                    self?.viewModel.getPhotos(albumId: self?.albumId ?? 0)
                }else{
                    self?.viewModel.search()
                }
                self?.photosCollectionView.reloadData()
            }).disposed(by: bag)
    }

}

