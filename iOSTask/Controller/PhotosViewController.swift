//
//  PhotosViewController.swift
//  iOSTask
//
//  Created by Omar on 11/09/2023.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! CollectionViewCell
        
        return cell
    }
    
    let searchController = UISearchBar()
    
    var albumId : Int?
    
    @IBOutlet weak var photosCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.titleView = searchController
        photosCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "item")
        photosCollectionView.dataSource = self
        photosCollectionView.delegate = self
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
