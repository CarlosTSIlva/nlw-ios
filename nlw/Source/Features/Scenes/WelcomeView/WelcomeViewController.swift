//
//  WelcomeViewController.swift
//  nlw
//
//  Created by Carlos Eduardo Teixeira Silva on 2024-12-11.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    let contentView: WelcomeView
    
    init(contentView: WelcomeView) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.view.addSubview(contentView)
        view.backgroundColor = Colors.gray100
        setupConstrains()
    }
    
    private func setupConstrains() {
        self.setupContentViewToViewController(contentView: contentView)
    }
}


