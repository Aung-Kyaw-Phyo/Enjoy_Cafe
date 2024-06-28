//
//  ShopDetailCollectionViewCell.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 20/06/2024.
//

import UIKit

class ShopDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var shopImageView: UIImageView!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    static let identifier = String(describing: ShopDetailCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: ShopDetailCollectionViewCell.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupShopDetail(_ details: Content) {
        shopImageView.image = details.image
        shopNameLabel.text = details.title
        locationLabel.text = "Location - \(details.location ?? "")"
        timeLabel.text = details.time
        distanceLabel.text = "Distance - \(details.distance ?? "")"
        ratingLabel.text = details.rating
    }

}
