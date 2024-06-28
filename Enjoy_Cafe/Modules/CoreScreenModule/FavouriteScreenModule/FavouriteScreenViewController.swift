//
//  FavouriteScreenViewController.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 20/06/2024.
//

import UIKit

class FavouriteScreenViewController: UIViewController {

    @IBOutlet weak var favProductCollection: UICollectionView!
    
    var products: [Product] = [
        .init(id: "00123", image: UIImage(named: "Cappuccino"), detail: "With Milk", time: "30 min delivery", rating: "5.0", title: "Cappuccino", price: 5500.0, createdDate: "5 Feb 2024", location: "Pansodan, Yangon"),
        .init(id: "00456", image: UIImage(named: "espresso"), detail: "With Chocolate", time: "20 min delivery", rating: "4.5", title: "Espresso", price: 4500.0, createdDate: "14 Feb 2024", location: "Bahan, Yangon"),
        .init(id: "00789", image: UIImage(named: "coffee"), detail: "With Milk", time: "30 min delivery", rating: "5.0", title: "Americano", price: 3500.0, createdDate: "12 Mar 2024", location: "Maynigone, Yangon"),
        .init(id: "1234", image: UIImage(named: "latte"), detail: "With Milk", time: "60 min delivery", rating: "4.9", title: "Latte", price: 4500.0, createdDate: "10 Jan 2024", location: "Hledan, Yangon"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        collectionViewSetup()
        registerSetup()
    }
    
    private func collectionViewSetup() {
        favProductCollection.delegate = self
        favProductCollection.dataSource = self
    }
    
    private func registerSetup() {
        favProductCollection.register(ProductOrderCollectionViewCell.nib(),
                                      forCellWithReuseIdentifier: ProductOrderCollectionViewCell.identifier)
    }

}

// MARK: - Extensions:

// MARK: - UICollectionViewDelegate
extension FavouriteScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ProductDetailScreenViewController.instantiate(name: .ProductDetailViewRouter)
        vc.products = products[indexPath.row]
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension FavouriteScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductOrderCollectionViewCell.identifier, for: indexPath) as? ProductOrderCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupOrderCollection(products[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension FavouriteScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 120)
    }
}


