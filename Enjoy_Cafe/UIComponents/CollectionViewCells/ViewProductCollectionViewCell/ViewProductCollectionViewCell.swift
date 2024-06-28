//
//  ViewProductCollectionViewCell.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 21/06/2024.
//

import UIKit

class ViewProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productCodeLabel: UILabel!
    @IBOutlet weak var productDetailLabel: UILabel!
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var addToCartButton: UIButton!
    
    static let identifier = String(describing: ViewProductCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: ViewProductCollectionViewCell.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        defaultSetup()
    }
    
    private func defaultSetup() {
        setupUI()
    }
    
    private func setupUI() {
        favButton.layer.cornerRadius = favButton.frame.size.width / 2
        favButton.clipsToBounds = true
        addToCartButton.layer.cornerRadius = addToCartButton.frame.size.width / 2
        addToCartButton.clipsToBounds = true
    }
    
    func productSetup(_ products: Product) {
        productImageView.image = products.image
        productNameLabel.text = products.title
        productPriceLabel.text = "\(products.price ?? 0.0) MMK"
        productCodeLabel.text = "Product ID: \(products.id ?? "")"
        productDetailLabel.text = products.detail
    }

}
