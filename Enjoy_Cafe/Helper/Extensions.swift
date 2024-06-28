//
//  Extensions.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 20/06/2024.
//

import UIKit

extension UITextField {
    var inputValue: String {
        return self.text ?? ""
    }
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}

extension UIViewController {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func instantiate(name: StoryboardEnum) -> Self {
        let storyboard = UIStoryboard(name: name.rawValue, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier) as! Self
        return controller
    }
    
    enum StoryboardEnum: String {
        case ProductDetailViewRouter = "ProductDetailScreen"
        case CartViewRouter = "CartScreen"
        case NearestShopViewRouter = "NearestShopScreen"
        case ViewProductRouter = "ViewProductScreen"
        case EditRouter = "EditAddressScreen"
        case ConfirmScreenRouter = "ConfirmScreen"
    }
}

