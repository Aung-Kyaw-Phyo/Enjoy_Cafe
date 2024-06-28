//
//  ProductDetailScreenViewController.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 20/06/2024.
//

import UIKit

class ProductDetailScreenViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDetailLabel: UILabel!
    @IBOutlet weak var productCodeLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var customStepperCountLabel: UILabel!
    
    @IBOutlet weak var percentBtn01: UIButton!
    @IBOutlet weak var percentBtn02: UIButton!
    @IBOutlet weak var percentBtn03: UIButton!
    
    @IBOutlet weak var sizeBtn01: UIButton!
    @IBOutlet weak var sizeBtn02: UIButton!
    @IBOutlet weak var sizeBtn03: UIButton!

    var products: Product?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        configureUI()
        setupData()
    }
    
    private func configureUI() {
        backButton.layer.cornerRadius = backButton.frame.size.width / 2
        backButton.clipsToBounds = true
        favButton.layer.cornerRadius = favButton.frame.size.width / 2
        favButton.clipsToBounds = true
        minusButton.layer.cornerRadius = minusButton.frame.size.width / 2
        minusButton.clipsToBounds = true
        plusButton.layer.cornerRadius = plusButton.frame.size.width / 2
        plusButton.clipsToBounds = true
    }
    
    private func setupData() {
        productImageView.image = products!.image
        productNameLabel.text = products!.title
        productDetailLabel.text = products!.detail
        productCodeLabel.text = "Product ID: \(products!.id ?? "")"
        productPriceLabel.text = "\(products!.price ?? 0.0) MMK"
    }
    
    // MARK: - User Interaction - Action
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
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
    
    @IBAction func productSugarPercentAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            percentBtn01.backgroundColor = UIColor(named: "PrimaryColor")
            percentBtn02.backgroundColor = UIColor(named: "SecondaryViewColor")
            percentBtn03.backgroundColor = UIColor(named: "SecondaryViewColor")
            
            percentBtn01.tintColor = UIColor(named: "SecondaryViewColor")
            percentBtn02.tintColor = UIColor(named: "PrimaryColor")
            percentBtn03.tintColor = UIColor(named: "PrimaryColor")
        case 1:
            percentBtn01.backgroundColor = UIColor(named: "SecondaryViewColor")
            percentBtn02.backgroundColor = UIColor(named: "PrimaryColor")
            percentBtn03.backgroundColor = UIColor(named: "SecondaryViewColor")
            
            percentBtn01.tintColor = UIColor(named: "PrimaryColor")
            percentBtn02.tintColor = UIColor(named: "SecondaryViewColor")
            percentBtn03.tintColor = UIColor(named: "PrimaryColor")
        case 2:
            percentBtn01.backgroundColor = UIColor(named: "SecondaryViewColor")
            percentBtn02.backgroundColor = UIColor(named: "SecondaryViewColor")
            percentBtn03.backgroundColor = UIColor(named: "PrimaryColor")
            
            percentBtn01.tintColor = UIColor(named: "PrimaryColor")
            percentBtn02.tintColor = UIColor(named: "PrimaryColor")
            percentBtn03.tintColor = UIColor(named: "SecondaryViewColor")
        default:
            break
        }
    }
    
    @IBAction func productSizeAction(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            sizeBtn01.backgroundColor = UIColor(named: "PrimaryColor")
            sizeBtn02.backgroundColor = UIColor(named: "SecondaryViewColor")
            sizeBtn03.backgroundColor = UIColor(named: "SecondaryViewColor")
            
            sizeBtn01.tintColor = UIColor(named: "SecondaryViewColor")
            sizeBtn02.tintColor = UIColor(named: "PrimaryColor")
            sizeBtn03.tintColor = UIColor(named: "PrimaryColor")
        case 1:
            sizeBtn01.backgroundColor = UIColor(named: "SecondaryViewColor")
            sizeBtn02.backgroundColor = UIColor(named: "PrimaryColor")
            sizeBtn03.backgroundColor = UIColor(named: "SecondaryViewColor")
            
            sizeBtn01.tintColor = UIColor(named: "PrimaryColor")
            sizeBtn02.tintColor = UIColor(named: "SecondaryViewColor")
            sizeBtn03.tintColor = UIColor(named: "PrimaryColor")
        case 2:
            sizeBtn01.backgroundColor = UIColor(named: "SecondaryViewColor")
            sizeBtn02.backgroundColor = UIColor(named: "SecondaryViewColor")
            sizeBtn03.backgroundColor = UIColor(named: "PrimaryColor")
            
            sizeBtn01.tintColor = UIColor(named: "PrimaryColor")
            sizeBtn02.tintColor = UIColor(named: "PrimaryColor")
            sizeBtn03.tintColor = UIColor(named: "SecondaryViewColor")
        default:
            break
        }
    }
    
    @IBAction func addToCartButtonAction(_ sender: UIButton) {
        let vc = CartScreenViewController.instantiate(name: .CartViewRouter)
        vc.products = products!
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}
