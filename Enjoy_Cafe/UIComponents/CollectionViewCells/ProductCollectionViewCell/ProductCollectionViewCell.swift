//
//  ProductCollectionViewCell.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 20/06/2024.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productIDCodeLabel: UILabel!
    @IBOutlet weak var productRatingLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var deliveryTimeLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    
    static let identifier = String(describing: ProductCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: ProductCollectionViewCell.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        favButton.layer.cornerRadius = favButton.frame.size.width / 2
    }
    
    func setupProducts(_ product: Product) {
        productImageView.image = product.image
        productNameLabel.text = product.title
        productPriceLabel.text = "\(product.price ?? 0.0) MMK"
        productIDCodeLabel.text = "Product ID: \(product.id ?? "")"
        productRatingLabel.text = product.rating
        locationLabel.text = product.location
        deliveryTimeLabel.text = product.time
    }

}
