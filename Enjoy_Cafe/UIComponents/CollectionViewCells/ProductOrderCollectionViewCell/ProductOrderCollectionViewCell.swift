//
//  ProductOrderCollectionViewCell.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 21/06/2024.
//

import UIKit

class ProductOrderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDetailLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productSizeLabel: UILabel!

    @IBOutlet weak var minusBtn: UIButton!
    @IBOutlet weak var plusBtn: UIButton!
    @IBOutlet weak var customStepperCountLabel: UILabel!
    
    @IBOutlet weak var deleteBtn: UIButton!
    
    static let identifier = String(describing: ProductOrderCollectionViewCell.self)
    
    static func nib() -> UINib {
        return UINib(nibName: ProductOrderCollectionViewCell.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        defaultSetup()
    }
    
    private func defaultSetup() {
        setupUI()
    }
    
    private func setupUI() {
        minusBtn.layer.cornerRadius = minusBtn.frame.size.width / 2
        minusBtn.clipsToBounds = true
        plusBtn.layer.cornerRadius = plusBtn.frame.size.width / 2
        plusBtn.clipsToBounds = true
    }
    
    func setupOrderCollection(_ products: Product) {
        productImageView.image = products.image
        productNameLabel.text = products.title
        productDetailLabel.text = products.detail
        productPriceLabel.text = "\(products.price ?? 0.0) MMK"
    }

    @IBAction func deleteBtnAction(_ sender: UIButton) {
        // TODO: Delete Action
    }
    
    @IBAction func stepperAction(_ sender: UIButton) {
        var num = Int(customStepperCountLabel.text!) ?? 0
        switch sender.tag {
        case 0:
            if num > 1 {
                num -= 1
            }
            customStepperCountLabel.text = String(num)
            break
        case 1:
            num += 1
            customStepperCountLabel.text = String(num)
            break
        default:
            break
        }
    }
    
}
