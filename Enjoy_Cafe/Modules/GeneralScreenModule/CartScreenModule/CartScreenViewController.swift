//
//  CartScreenViewController.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 21/06/2024.
//

import UIKit

class CartScreenViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var currentLocationLabel: UILabel!
    @IBOutlet weak var orderIDLabel: UILabel!
    @IBOutlet weak var orderDateLabel: UILabel!
    @IBOutlet weak var productOrderCollection: UICollectionView!
    @IBOutlet weak var subTotalAmountLabel: UILabel!
    @IBOutlet weak var ctAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var editButton: UIButton!
    
    var productOrders: [Product] = [
        .init(id: "00123", image: UIImage(named: "detail01"), detail: "With Milk", time: "30 min delivery", rating: "5.0", title: "Cortadito", price: 5500.0, createdDate: "5 Feb 2024", location: "Pansodan, Yangon"),
        .init(id: "00456", image: UIImage(named: "detail02"), detail: "With Chocolate", time: "20 min delivery", rating: "4.5", title: "Avocado Coffee", price: 4500.0, createdDate: "14 Feb 2024", location: "Bahan, Yangon"),
        .init(id: "00789", image: UIImage(named: "detail03"), detail: "With Milk", time: "30 min delivery", rating: "5.0", title: "Cappuccino", price: 3500.0, createdDate: "12 Mar 2024", location: "Maynigone, Yangon"),
    ]
    
    var products: Product?
    
    var productOrder: [Product] = [] {
        didSet {
            calculateAmount(products: productOrder)
            productOrderCollection.reloadData()
        }
    }
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        setupUI()
        collectionViewSetup()
        registerSetup()
        orderSetup()
    }
    
    private func setupUI() {
        backButton.layer.cornerRadius = backButton.frame.size.width / 2
        backButton.clipsToBounds = true
    }
    
    private func collectionViewSetup() {
        productOrderCollection.delegate = self
        productOrderCollection.dataSource = self
    }
    
    private func registerSetup() {
        productOrderCollection.register(ProductOrderCollectionViewCell.nib(),
                                        forCellWithReuseIdentifier: ProductOrderCollectionViewCell.identifier)
    }
    
    private func orderSetup() {
        orderIDLabel.text = "Order ID - #\(products!.id ?? "")"
        orderDateLabel.text = "Order Date - \(products!.createdDate ?? "")"
    }
    
    private func calculateAmount(products: [Product]) {
        let subAmount = products.map({ $0.price ?? 0 }).reduce(0, +)
        let ct = (subAmount * 5) / 100
        let total = subAmount + ct
        subTotalAmountLabel.text = "\(subAmount) MMK"
        ctAmountLabel.text = "\(ct) MMK"
        totalAmountLabel.text = "\(total) MMK"
    }
    
    // MARK: - User Interaction - Back Action
    @IBAction func backBtnAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func editBtnAction(_ sender: UIButton) {
        let vc = EditAddressScreenViewController.instantiate(name: .EditRouter)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    // MARK: - User Interaction - Action
    @IBAction func checkOutBtnAction(_ sender: UIButton) {
        let vc = ConfirmScreenViewController.instantiate(name: .ConfirmScreenRouter)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}

// MARK: - Extension:

// MARK: - UICollectionViewDelegate
extension CartScreenViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension CartScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productOrders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductOrderCollectionViewCell.identifier, for: indexPath) as? ProductOrderCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupOrderCollection(productOrders[indexPath.row])
        return cell
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CartScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 360, height: 120)
    }
}
