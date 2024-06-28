//
//  ProfileScreenViewController.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 20/06/2024.
//

import UIKit

class ProfileScreenViewController: UIViewController {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private var showOptions: [ShowOptions] = [
        .init(icon: UIImage(named: "option1"), title: "Edit Profile"),
        .init(icon: UIImage(named: "option2"), title: "Settings"),
        .init(icon: UIImage(named: "option3"), title: "Services"),
        .init(icon: UIImage(named: "option4"), title: "FAQs"),
        .init(icon: UIImage(named: "option5"), title: "Log Out"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        designableView()
        tableViewSetup()
    }
    
    private func designableView() {
        userImageView.layer.cornerRadius = 40
        userImageView.clipsToBounds = true
    }
    
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
    }

}

extension ProfileScreenViewController: UITableViewDelegate {
    
}

extension ProfileScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier, for: indexPath) as? ProfileTableViewCell else {
            return UITableViewCell()
        }
        cell.configOptions(options: showOptions[indexPath.row])
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    
}
