//
//  FlowController.swift
//  nlw
//
//  Created by Carlos Eduardo Teixeira Silva on 2024-12-10.
//

import Foundation
import UIKit

class FlowCoondinator {
    private var navigationController: UINavigationController?
    
    public init() {
    }
    
    func start() -> UINavigationController? {
        let startViewController = UIViewController()
        startViewController.view.backgroundColor = .red
        
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        return navigationController
    }
}
