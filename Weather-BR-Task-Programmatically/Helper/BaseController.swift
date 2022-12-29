//
//  BaseController.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 28.12.22.
//

import UIKit

class BaseController: UIViewController {
    
    lazy var navBar: UINavigationBar = {
        let nav = UINavigationBar()
        nav.backgroundColor = UIColor(red: 43/255, green: 31/255, blue: 88/255, alpha: 1)
        title = "CLIMA"
        view.addSubview(nav)
        return nav
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(navBar)
        view.backgroundColor = UIColor(red: 57/255, green: 45/255, blue: 117/255, alpha: 1)
    }
    



}
