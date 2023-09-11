//
//  ProfileViewController.swift
//  iOSTask
//
//  Created by Omar on 10/09/2023.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath) as! TableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photosVC = PhotosViewController(nibName: "PhotosViewController", bundle: nil)
        self.navigationController?.pushViewController(photosVC, animated: true)
    }
    
    @IBOutlet weak var userName: UILabel!
    
    
    @IBOutlet weak var Address: UILabel!
    
    
    @IBOutlet weak var albumsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        albumsTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "item")
        albumsTableView.dataSource = self
        albumsTableView.delegate = self
        title = "Profile"
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
