//
//  ConfirmScreenViewController.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 21/06/2024.
//

import UIKit

class ConfirmScreenViewController: UIViewController {
    
    @IBOutlet weak var ratingStarImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToHomeBtnAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let controller = storyboard.instantiateViewController(identifier: "DesignableTabBarViewController") as? DesignableTabBarViewController {
            controller.modalTransitionStyle = .crossDissolve
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true)
        }
    }
    
}
