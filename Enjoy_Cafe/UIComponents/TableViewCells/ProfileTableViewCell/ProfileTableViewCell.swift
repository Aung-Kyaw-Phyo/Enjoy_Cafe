//
//  ProfileTableViewCell.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 20/06/2024.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    static let identifier = String(describing: ProfileTableViewCell.self)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configOptions(options: ShowOptions) {
        imageView?.image = options.icon
        textLabel?.text = options.title
    }

}
