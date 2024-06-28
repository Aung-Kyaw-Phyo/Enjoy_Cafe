//
//  NearestShopScreenViewController.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 20/06/2024.
//

import UIKit
import MapKit

class NearestShopScreenViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var shopImageView: UIImageView!
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var shopDetailLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var shopDescriptionLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var backButton: UIButton!

    var contents: Content?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        setupUI()
        configDetail()
        let initialLocation = CLLocation(latitude: 30.025422, longitude: 31.015311)
        setStartingLocation(location: initialLocation, distance: 1000)
    }

    private func setupUI() {
        backButton.layer.cornerRadius = backButton.frame.size.width / 2
        backButton.clipsToBounds = true
    }
    
    func configDetail() {
        shopImageView.image = contents!.image
        shopNameLabel.text = contents!.title
        timeLabel.text = contents!.time
        locationLabel.text = "Location - \(contents!.location ?? "")"
        ratingLabel.text = contents!.rating
        distanceLabel.text = contents!.distance
    }
    
    private func setStartingLocation(location: CLLocation, distance: CLLocationDistance) {
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
        mapView.setRegion(region, animated: true)
        let regionBoundary = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 8143, longitudinalMeters: 11861)
        mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: regionBoundary), animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 500000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
    
    // MARK: - User Interaction - Action
    @IBAction func backButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    // MARK: - User Interaction - Actions & Targets
    @IBAction func viewProductsButtonAction(_ sender: UIButton) {
        let vc = ViewProductScreenViewController.instantiate(name: .ViewProductRouter)
        vc.shopDetails = contents!
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }

}
