//
//  MapScreenViewController.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 20/06/2024.
//

import UIKit
import MapKit

class MapScreenViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var searchBarTextField: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var shopDetailCollection: UICollectionView!
    
    // MARK: Properties
    var contents: [Content] = [
        .init(id: "00123", image: UIImage(named: "shop01"), title: "Central Cafe", rating: "5.0 ratings", time: "9 AM to 7 PM", distance: "1.5 km", location: "Pansodan, Yangon"),
        .init(id: "00456", image: UIImage(named: "shop02"), title: "JoJo Cafe", rating: "6.5 ratings", time: "9 AM to 5 PM", distance: "2.4 km", location: "Bahan, Yangon"),
        .init(id: "00789", image: UIImage(named: "shop03"), title: "Enjoy Cafe", rating: "5.5 ratings", time: "9 AM to 6 PM", distance: "5.5 km", location: "Maynigone, Yangon"),
        .init(id: "1234", image: UIImage(named: "shop04"), title: "Coffee Cafe", rating: "6.0 ratings", time: "9 AM to 9 PM", distance: "7.4 km", location: "Hledan, Yangon")
    ]
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        collectionViewSetup()
        textFieldSetup()
        registerSetup()
        let initialLocation = CLLocation(latitude: 30.025422, longitude: 31.015311)
        setStartingLocation(location: initialLocation, distance: 1000)
    }
    
    private func collectionViewSetup() {
        shopDetailCollection.delegate = self
        shopDetailCollection.dataSource = self
    }
    
    private func textFieldSetup() {
        searchBarTextField.delegate = self
    }
    
    private func registerSetup() {
        shopDetailCollection.register(ShopDetailCollectionViewCell.nib(),
                                      forCellWithReuseIdentifier: ShopDetailCollectionViewCell.identifier)
    }
    
    private func setStartingLocation(location: CLLocation, distance: CLLocationDistance) {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
        mapView.setRegion(region, animated: true)
        let regionBoundary = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 8143, longitudinalMeters: 11861)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: regionBoundary), animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 500000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }

}

// MARK: - Extensions:

// MARK: - UICollectionViewDelegate
extension MapScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = NearestShopScreenViewController.instantiate(name: .NearestShopViewRouter)
        vc.contents = contents[indexPath.row]
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}

// MARK: - UICollectionViewDataSource
extension MapScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShopDetailCollectionViewCell.identifier, for: indexPath) as? ShopDetailCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupShopDetail(contents[indexPath.row])
        return cell
    }
}

// MARK: - UITextFieldDelegate
extension MapScreenViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == searchBarTextField {
            searchBarTextField.resignFirstResponder()
        }
        return true
    }
}
