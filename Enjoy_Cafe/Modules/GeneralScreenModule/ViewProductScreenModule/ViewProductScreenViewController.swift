//
//  ViewProductScreenViewController.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 21/06/2024.
//

import UIKit

class ViewProductScreenViewController: UIViewController {
    
    @IBOutlet weak var shopImageView: UIImageView!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var productCollectionView: UICollectionView!
    @IBOutlet weak var backButton: UIButton!
    
    // MARK: Properties
    var products: [Product] = [
        .init(id: "00123", image: UIImage(named: "detail01"), detail: "With Milk", time: "30 min delivery", rating: "5.0", title: "Cortadito", price: 5500.0, createdDate: "5 Feb 2024", location: "Pansodan, Yangon"),
        .init(id: "00456", image: UIImage(named: "detail02"), detail: "With Chocolate", time: "20 min delivery", rating: "4.5", title: "Avocado Coffee", price: 4500.0, createdDate: "14 Feb 2024", location: "Bahan, Yangon"),
        .init(id: "00789", image: UIImage(named: "detail03"), detail: "With Milk", time: "30 min delivery", rating: "5.0", title: "Cappuccino", price: 3500.0, createdDate: "12 Mar 2024", location: "Maynigone, Yangon"),
        .init(id: "1234", image: UIImage(named: "detail04"), detail: "With Chocolate", time: "60 min delivery", rating: "4.9", title: "Chocolate coffe", price: 4500.0, createdDate: "10 Jan 2024", location: "Hledan, Yangon"),
        .init(id: "1234", image: UIImage(named: "detail05"), detail: "With Milk", time: "20 min delivery", rating: "5.0", title: "Normal coffee", price: 5500.0, createdDate: "1 Jun 2024", location: "Sanchaung, Yangon"),
        .init(id: "01623", image: UIImage(named: "detail06"), detail: "With Milk", time: "10 min delivery", rating: "4.9", title: "South filtered", price: 5500.0, createdDate: "10 May 2024", location: "Lanmadaw, Yangon"),
        .init(id: "00123", image: UIImage(named: "detail01"), detail: "With Milk", time: "30 min delivery", rating: "5.0", title: "Cortadito", price: 5500.0, createdDate: "5 Feb 2024", location: "Pansodan, Yangon"),
        .init(id: "00456", image: UIImage(named: "detail02"), detail: "With Milk", time: "20 min delivery", rating: "4.5", title: "Avocado Coffee", price: 4500.0, createdDate: "14 Feb 2024", location: "Bahan, Yangon"),
        .init(id: "00789", image: UIImage(named: "detail03"), detail: "With Milk", time: "30 min delivery", rating: "5.0", title: "Cappuccino", price: 3500.0, createdDate: "12 Mar 2024", location: "Maynigone, Yangon"),
        .init(id: "1234", image: UIImage(named: "detail04"), detail: "With Milk", time: "60 min delivery", rating: "4.9", title: "Chocolate coffe", price: 4500.0, createdDate: "10 Jan 2024", location: "Hledan, Yangon")
    ]

    var shopDetails: Content?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        setupUI()
        collectionViewSetup()
        registerSetup()
        upcomingShopDetails()
    }
    
    private func setupUI() {
        backButton.layer.cornerRadius = backButton.frame.size.width / 2
        backButton.clipsToBounds = true
    }

    private func collectionViewSetup() {
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
    }
    
    private func registerSetup() {
        productCollectionView.register(ViewProductCollectionViewCell.nib(),
                                       forCellWithReuseIdentifier: ViewProductCollectionViewCell.identifier)
    }
    
    @IBAction func backBtnAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    func upcomingShopDetails() {
        shopImageView.image = shopDetails!.image
        shopNameLabel.text = shopDetails!.title
        timeLabel.text = shopDetails!.time
        locationLabel.text = "Location - \(shopDetails!.location ?? "")"
        distanceLabel.text = "Distance - \(shopDetails!.distance ?? "")"
    }
    
}

// MARK: - Extensions:

// MARK: - UICollectionViewDelegate
extension ViewProductScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ProductDetailScreenViewController.instantiate(name: .ProductDetailViewRouter)
        vc.products = products[indexPath.row]
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension ViewProductScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewProductCollectionViewCell.identifier, for: indexPath) as? ViewProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.productSetup(products[indexPath.row])
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewProductScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 230)
    }
}
