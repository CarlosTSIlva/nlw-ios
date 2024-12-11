//
//  FlowController.swift
//  nlw
//
//  Created by Carlos Eduardo Teixeira Silva on 2024-12-10.
//

import Foundation
import UIKit

class NearbyFlowController {
    private var navigationController: UINavigationController?
    
    public init() {
    }
    
    func start() -> UINavigationController? {
        let contentView = SpashView()
        let startViewController = SpashViewController(contentView: contentView)
        self.navigationController = UINavigationController(rootViewController: startViewController)
        
        
        return navigationController
    }
}
