//
//  ViewController.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 20/06/2024.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var searchBarTextField: UITextField!
    
    @IBOutlet weak var specialCollectionView: UICollectionView!
    @IBOutlet weak var nearestShopCollectionView: UICollectionView!

    // MARK: - Properties
    var products: [Product] = [
        .init(id: "00123", image: UIImage(named: "Cappuccino"), detail: "With Milk", time: "30 min delivery", rating: "5.0", title: "Cappuccino", price: 5500.0, createdDate: "5 Feb 2024", location: "Pansodan, Yangon"),
        .init(id: "00456", image: UIImage(named: "coffee"), detail: "With Chocolate", time: "20 min delivery", rating: "4.5", title: "Espresso", price: 4500.0, createdDate: "14 Feb 2024", location: "Bahan, Yangon"),
        .init(id: "00789", image: UIImage(named: "Cappuccino"), detail: "With Milk", time: "30 min delivery", rating: "5.0", title: "Americano", price: 3500.0, createdDate: "12 Mar 2024", location: "Maynigone, Yangon"),
        .init(id: "1234", image: UIImage(named: "coffee"), detail: "With Milk", time: "60 min delivery", rating: "4.9", title: "Latte", price: 4500.0, createdDate: "10 Jan 2024", location: "Hledan, Yangon"),
        .init(id: "1234", image: UIImage(named: "Cappuccino"), detail: "With Chocolate", time: "20 min delivery", rating: "5.0", title: "Mocha", price: 5500.0, createdDate: "1 Jun 2024", location: "Sanchaung, Yangon"),
        .init(id: "01623", image: UIImage(named: "coffee"), detail: "With Milk", time: "10 min delivery", rating: "4.9", title: "Cappuccino", price: 5500.0, createdDate: "10 May 2024", location: "Lanmadaw, Yangon"),
    ]
    
    var contents: [Content] = [
        .init(id: "00123", image: UIImage(named: "shop01"), title: "Central Cafe", rating: "5.0 ratings", time: "9 AM to 7 PM", distance: "1.5 km", location: "Pansodan, Yangon"),
        .init(id: "00456", image: UIImage(named: "shop02"), title: "JoJo Cafe", rating: "6.5 ratings", time: "9 AM to 5 PM", distance: "2.4 km", location: "Bahan, Yangon"),
        .init(id: "00789", image: UIImage(named: "shop03"), title: "Enjoy Cafe", rating: "5.5 ratings", time: "9 AM to 6 PM", distance: "5.5 km", location: "Maynigone, Yangon"),
        .init(id: "1234", image: UIImage(named: "shop04"), title: "Coffee Cafe", rating: "6.0 ratings", time: "9 AM to 9 PM", distance: "7.4 km", location: "Hledan, Yangon")
    ]
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }

    private func defaultSetup() {
        configureUI()
        configTitle()
        textFieldSetup()
        collectionViewSetup()
        registerSetup()
    }
    
    private func configureUI() {
        configTitle()
        userImageView.layer.cornerRadius = userImageView.frame.size.width / 2
        userImageView.clipsToBounds = true
        searchBarTextField.backgroundColor = UIColor(named: "SearchBarBGColor")
        searchBarTextField.clipsToBounds = true
        searchBarTextField.borderStyle = .roundedRect
    }
    
    private func configTitle() {
        introLabel.text = "Find the best coffee for you"
        let str = "Coffee"
        let range = (introLabel.text! as NSString).range(of: str)
        let attributedText = NSMutableAttributedString.init(string: introLabel.text!)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(named: "PrimaryColor")!,
                                    range: range)
        introLabel.attributedText = attributedText
    }
    
    private func textFieldSetup() {
        searchBarTextField.delegate = self
    }
    
    private func collectionViewSetup() {
        specialCollectionView.delegate = self
        specialCollectionView.dataSource = self
        nearestShopCollectionView.delegate = self
        nearestShopCollectionView.dataSource = self
    }
    
    private func registerSetup() {
        specialCollectionView.register(ProductCollectionViewCell.nib(),
                                       forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        nearestShopCollectionView.register(NearestShopCollectionViewCell.nib(),
                                           forCellWithReuseIdentifier: NearestShopCollectionViewCell.identifier)
    }

}

// MARK: - Extensions:

// MARK: - UICollectionViewDelegate
extension HomeScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == specialCollectionView {
            let vc = ProductDetailScreenViewController.instantiate(name: .ProductDetailViewRouter)
            vc.products = products[indexPath.row]
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        } else {
            let vc = NearestShopScreenViewController.instantiate(name: .NearestShopViewRouter)
            vc.contents = contents[indexPath.row]
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
    
}

// MARK: - UICollectionViewDataSource
extension HomeScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case specialCollectionView:
            return products.count
        case nearestShopCollectionView:
            return contents.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case specialCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as? ProductCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.setupProducts(products[indexPath.row])
            return cell
        case nearestShopCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NearestShopCollectionViewCell.identifier, for: indexPath) as? NearestShopCollectionViewCell else {
                return UICollectionViewCell()
            }
            cell.configNearestShop(contents[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
}

// MARK: - UITextFieldDelegate
extension HomeScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchBarTextField {
            searchBarTextField.resignFirstResponder()
        }
        return true
    }
}
