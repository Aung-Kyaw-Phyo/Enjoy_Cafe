//
//  SplashScreenViewController.swift
//  Enjoy_Cafe
//
//  Created by Aung Kyaw Phyo on 21/06/2024.
//

import UIKit
import Lottie

class SplashScreenViewController: UIViewController {
    
    @IBOutlet weak var animationView: LottieAnimationView!

    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        designableAnimationView()
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(routerViewController), userInfo: nil, repeats: false)
    }
    
    @objc func routerViewController() {
        guard let viewController = UIStoryboard(name: "LoginScreen", bundle: nil).instantiateViewController(identifier: "LoginScreenViewController") as? LoginScreenViewController else {return}
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = viewController
            UIView.transition(with: window,
                              duration: 0.25,
                              options: .transitionCrossDissolve,
                              animations: nil,
                              completion: nil)
        }
    }

    // MARK: Lottie Animation View
    private func designableAnimationView() {
        let animation = LottieAnimation.named("Animation")
        animationView.animation = animation
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.5
        view.addSubview(animationView)
        animationView.play()
    }

}
