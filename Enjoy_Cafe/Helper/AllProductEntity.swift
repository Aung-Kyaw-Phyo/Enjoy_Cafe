//
//  AllProductEntity.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 20/06/2024.
//

import UIKit

struct Product {
    var id: String?
    var image: UIImage?
    var detail: String?
    var time: String?
    var rating: String?
    var title: String?
    var price: Double?
    var createdDate: String?
    var location: String?
}

struct Content {
    var id: String?
    var image: UIImage?
    var title: String?
    var rating: String?
    var time: String?
    var distance: String?
    var location: String?
}

struct ShowOptions {
    let icon: UIImage?
    let title: String?
}
