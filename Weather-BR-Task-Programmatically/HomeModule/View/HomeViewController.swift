//
//  HomeViewController.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 21.12.22.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var navBar: UINavigationBar = {
        let nav = UINavigationBar()
        nav.backgroundColor = UIColor(red: 43/255, green: 31/255, blue: 88/255, alpha: 1)
        title = "CLIMA"
        view.addSubview(nav)
        return nav
    }()
    
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
    
    private lazy var citynameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .semibold)
        label.textAlignment = .center
        view.addSubview(label)
        return label
    }()
    
    private lazy var conditionLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .center
        view.addSubview(label)
        return label
    }()
    
    private lazy var topView: TopView = {
        let view = TopView()
        view.backgroundColor = UIColor(red: 48/255, green: 29/255, blue: 99/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        view.layer.borderWidth = 1.0
        self.view.addSubview(view)
        return view
    }()
    
    private lazy var daysForecastLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.textAlignment = .center
        view.addSubview(label)
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        view.layer.borderWidth = 1.0
        self.view.addSubview(view)
        return view
    }()
    
    private lazy var daysCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 270)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.delegate = self
        collView.dataSource = self
        collView.backgroundColor = .clear
        collView.showsHorizontalScrollIndicator = false
        view.addSubview(collView)
        return collView
    }()
    
    let viewModel = HomeViewModel(service: ApiService())
    
    private var currentConditions: CurrentConditions?
    
    private var topCellData: [TopCollectionCellModel] = []
    
    private var daysCollectionViewData: [CurrentConditions] = []
    
    private let topCellID = "\(TopCollectionCell.self)"
    private let daysCellID = "\(DaysCollectionCell.self)"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 57/255, green: 45/255, blue: 117/255, alpha: 1)
        setupConstrains()
        
        self.view.addSubview(navBar)
        self.navigationItem.leftBarButtonItem = locationButton
        self.navigationItem.rightBarButtonItem = searchButton
        
        daysCollectionView.register(DaysCollectionCell.self, forCellWithReuseIdentifier: daysCellID)
        
        loadData()
    }
    
    private func setupConstrains() {
        
        navBar.anchor(top: nil, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, size: CGSize(width: 0, height: 100))
        
        citynameLabel.anchor(top: navBar.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 12, left: 40, bottom: 0, right: 40),size: CGSize(width: 0, height: 36))
        
        conditionLabel.anchor(top: citynameLabel.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor,padding: .init(top: 4, left: 40, bottom: 0, right: 40),size: CGSize(width: 0, height: 20))
        
        topView.anchor(top: conditionLabel.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20), size: CGSize(width: 0, height: 270))
        
        daysForecastLabel.anchor(top: topView.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 38, left: 0, bottom: 12, right: 16), size: CGSize(width: 0, height: 24))
        
        lineView.anchor(top: daysForecastLabel.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 1))
        
        daysCollectionView.anchor(top: lineView.bottomAnchor, bottom: nil, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 28, left: 0, bottom: 0, right: 0), size: CGSize(width: 0, height: 230))
        
    }
    
    
    private var topViewData: TopViewModel?
    
    private func loadData() {
        viewModel.getCurrentData {
            self.citynameLabel.text = self.viewModel.cityName
            if  self.viewModel.currentWeather != nil, self.viewModel.currentWeather.currentConditions != nil {
                self.conditionLabel.text = self.viewModel.currentWeather.days![0].conditions ?? ""
                self.currentConditions = self.viewModel.currentWeather.currentConditions
                self.setupTopViewData()
                self.currentConditions = self.viewModel.currentWeather.currentConditions
                self.topView.configure(cityName: self.viewModel.cityName, data: self.topViewData!)
                self.daysCollectionViewData = self.viewModel.currentWeather.days!
                self.daysForecastLabel.text = "14 days forecast"
            }
            DispatchQueue.main.async {
                self.daysCollectionView.reloadData()
            }
        }
    }
    
    private func setupTopViewData() {
        loadTopCollViewArray()
        topViewData = TopViewModel(temp: "\(self.viewModel.currentWeather.days![0].temp ?? 0.0)",
                                   feelsLike: "\(currentConditions!.feelslike ?? 0.0)",
                                   location: "\(viewModel.cityName)",
                                   date: "\(self.viewModel.currentWeather.days![0].datetime ?? "")",
                                   weatherIcon: "\(currentConditions!.icon ?? "")",
                                   topCollectionData: topCellData)
    }
    
    
    private func loadTopCollViewArray() {
        
        if currentConditions != nil {
            topCellData.removeAll()
            
            topCellData.append(TopCollectionCellModel(image: "wind", text1: "Wind", text2: "\(currentConditions?.windspeed ?? 0.0) km/h"))
            topCellData.append(TopCollectionCellModel(image: "drop.fill", text1: "Humidity",
                                                      text2: "\(currentConditions?.humidity ?? 0.0)%"))
            topCellData.append(TopCollectionCellModel(image: "eye.fill", text1: "Visibility",
                                                      text2: "\(Int(currentConditions?.visibility ?? 0.0)) km"))
            topCellData.append(TopCollectionCellModel(image: "rectangle.compress.vertical", text1: "Pressure",
                                                      text2: "\(currentConditions?.pressure ?? 0.0) Pa"))
            topCellData.append(TopCollectionCellModel(image: "cloud.fill", text1: "Cloudy",
                                                      text2: "\(currentConditions?.cloudcover ?? 0.0) %"))
        }
    }
    
    
    @objc func locationTapped() {
        viewModel.cityName = "Toronto"
        loadData()    }
    
    @objc func  searchTapped() {
        let searchVC = SearchViewController()
        navigationController?.show(searchVC, sender: nil)
    }
    
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return daysCollectionViewData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = daysCollectionView.dequeueReusableCell(withReuseIdentifier: daysCellID, for: indexPath) as! DaysCollectionCell
        cell.configure(data: daysCollectionViewData[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 124, height: daysCollectionView.frame.height)
        
    }
}

