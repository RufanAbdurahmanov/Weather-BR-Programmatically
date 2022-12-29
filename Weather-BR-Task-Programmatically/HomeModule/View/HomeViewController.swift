//
//  HomeViewController.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 21.12.22.
//

import UIKit

class HomeViewController: BaseController {
    
    lazy var searchButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                     style: .done,
                                     target: self,
                                     action: #selector(searchTapped))
        button.tintColor = .white
        return button
    }()
    
    lazy var locationButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "location.north.fill"),
                                     style: .done,
                                     target: self,
                                     action: #selector(locationTapped))
        button.tintColor = .white
        return button
    }()
    
    private lazy var customTopView: CustomTopView = {
        let view = CustomTopView()
        view.backgroundColor = .clear
        self.view.addSubview(view)
        return view
    }()
    
    private lazy var topView: TopView = {
        let view = TopView()
        self.view.addSubview(view)
        return view
    }()
    
    private lazy var bottomView: BottomView = {
        let view = BottomView()
        view.backgroundColor = .clear
        self.view.addSubview(view)
        return view
    }()

    let viewModel = HomeViewModel(service: ApiService())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstrains()
        self.navigationItem.leftBarButtonItem = locationButton
        self.navigationItem.rightBarButtonItem = searchButton
        
        loadData()
    }
    
    private func setupConstrains() {
        
        navBar.anchor(top: view.topAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, size: CGSize(width: 0, height: 100))
        
        customTopView.anchor(top: navBar.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 12, left: 40, bottom: 0, right: 40),size: CGSize(width: 0, height: 72))
        
        topView.anchor(top: customTopView.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 12, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: 270))
        
        bottomView.anchor(top: topView.bottomAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
    }
    

    private func loadData() {
        self.viewModel.getCurrentData {
            
            self.customTopView.configure(cityName: self.viewModel.cityName, condition: self.viewModel.daysCollectionViewDatas()[0].conditions!)
            
            self.topView.configure(cityName: self.viewModel.cityName, data: self.viewModel.topViewData())
            
            self.bottomView.configure(data: self.viewModel.daysCollectionViewDatas())
        }
    }
    
    @objc private func locationTapped() {
        viewModel.cityName = "Toronto"
        loadData()
    }
    
    @objc private func searchTapped() {
        let searchVC = SearchViewController()
        navigationController?.show(searchVC, sender: nil)
    }
}


