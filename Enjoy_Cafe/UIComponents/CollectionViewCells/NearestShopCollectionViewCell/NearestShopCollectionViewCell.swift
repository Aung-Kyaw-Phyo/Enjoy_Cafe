//
//  NearestShopCollectionViewCell.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 20/06/2024.
//

import UIKit

class NearestShopCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var shopImageView: UIImageView!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var designableView: UIView!
    
    static let identifier = String(describing: NearestShopCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: NearestShopCollectionViewCell.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupDesignableView()
    }
    
    private func setupDesignableView() {
        designableView.roundCorners(corners: [.topRight, .bottomLeft], radius: 20)
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = designableView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        designableView = blurEffectView
    }
    
    func configNearestShop(_ model: Content) {
        shopImageView.image = model.image
        shopNameLabel.text = model.title
        ratingLabel.text = model.rating
        distanceLabel.text = model.distance
        locationLabel.text = "Location - \(model.location ?? "")"
    }

}
