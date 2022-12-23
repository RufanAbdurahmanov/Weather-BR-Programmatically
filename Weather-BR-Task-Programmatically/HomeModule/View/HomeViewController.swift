//
//  HomeViewController.swift
//  Weather-BR-Task-Programmatically
//
//  Created by Rufan Abdurahmanov on 21.12.22.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: -Location Button
    
    
    
    lazy var locationButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "location.north.fill"),
                                     style: .done,
                                     target: self,
                                     action: #selector(locationTapped))
        button.tintColor = .white
        return button
    }()
    

    // MARK: - Base View
    
    lazy var baseView: UIView = {
        let bView = UIView()
        bView.backgroundColor = UIColor(red: 56/255, green: 44/255, blue: 112/255, alpha: 1)
        self.view.addSubview(bView)
        return bView
    }()
    

    // MARK: -Cityname Label

    lazy var citynameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        baseView.addSubview(label)
        return label
    }()



    // MARK: - Top View

    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 43/255, green: 31/255, blue: 88/255, alpha: 1)
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.gray.withAlphaComponent(0.5).cgColor
        view.layer.borderWidth = 1.0
        baseView.addSubview(view)
        return view
    }()
    
    // MARK: - Today Label
    
    lazy var todayLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubview(label)
        return label
    }()
    
    
    
    // MARK: - Tempreture Label
    
    lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = .systemFont(ofSize: 65, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubview(label)
        return label
    }()
    
    // MARK: - °C Label
    
    lazy var degreeSelsiumLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .orange
        label.font = .systemFont(ofSize: 26, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubview(label)
        return label
    }()
    
    // MARK: - Feels like Label
    
    lazy var feelsLikeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .gray.withAlphaComponent(0.8)
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubview(label)
        return label
    }()
    
    // MARK: - location Image View
    
    lazy var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .center
        topView.addSubview(imageView)
        return imageView
    }()
    
    // MARK: - location Label
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubview(label)
        return label
    }()
    
    // MARK: - Date Label
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.dateToString(text: "\(viewModel.currentWeather?.days![0].datetime ?? "" )")
        label.textColor = .white.withAlphaComponent(0.9)
        label.font = .systemFont(ofSize: 19, weight: .regular)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubview(label)
        return label
    }()
    
    
    // MARK: - Icon ImageView
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.image = nil
        topView.addSubview(imageView)
        return imageView
    }()
    
    
    // MARK: - Top CollectionView
    lazy var topCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 76, height: 66)
        layout.minimumLineSpacing = CGFloat(10.0)
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.translatesAutoresizingMaskIntoConstraints = false
        collView.delegate = self
        collView.dataSource = self
        collView.backgroundColor = .clear
        collView.showsHorizontalScrollIndicator = false
        baseView.addSubview(collView)
        return collView
    }()
    


    // MARK: -14 Days forecast Label
    lazy var daysForecastLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.text = "14 Days Forecast"
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        baseView.addSubview(label)
        return label
    }()


    // MARK: - Collection View

    lazy var daysCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 120, height: 270)
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.translatesAutoresizingMaskIntoConstraints = false
        collView.delegate = self
        collView.dataSource = self
        collView.backgroundColor = .clear
        collView.showsHorizontalScrollIndicator = false
        baseView.addSubview(collView)
        return collView
    }()
    
    
    
    let viewModel = HomeViewModel(service: ApiService())
    var currentConditions: CurrentConditions?
    
    var topCellData: [TopViewCellModel] = []
    
    var daysCollectionViewData: [CurrentConditions] = []
    
    let topCellID = "\(TopCollectionCell.self)"
    let daysCellID = "\(DaysCollectionCell.self)"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 49/255, green: 31/255, blue: 99/255, alpha: 1)
        
        
        // MARK: -Navigation Bar
        let navHeight = self.view.frame.height * 0.01
        let navWidth = view.frame.width
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: navWidth, height: navHeight))
        navBar.backgroundColor = .clear
        self.view.addSubview(navBar)
        self.navigationItem.leftBarButtonItem = locationButton
        
        baseView.fillSuperView(padding: .init(top: 120, left: 0, bottom: 0, right: 0))
        
        citynameLabel.anchor(top: baseView.topAnchor, bottom: nil, leading: baseView.leadingAnchor, trailing: baseView.trailingAnchor,padding: .init(top: 16, left: 40, bottom: 0, right: 40),size: CGSize(width: 0, height: 40))
        
        NSLayoutConstraint.activate([
            
            
            topView.topAnchor.constraint(equalTo: citynameLabel.bottomAnchor, constant: 16),
            topView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 20),
            topView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -20),
            topView.heightAnchor.constraint(equalToConstant: 270),
        
            
            todayLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 16),
            todayLabel.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 20),
            todayLabel.heightAnchor.constraint(equalToConstant: 25),
            
            
            tempLabel.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 4),
            tempLabel.leadingAnchor.constraint(equalTo: todayLabel.leadingAnchor),
            tempLabel.heightAnchor.constraint(equalToConstant: 70),
            
            
            degreeSelsiumLabel.topAnchor.constraint(equalTo: tempLabel.topAnchor),
            degreeSelsiumLabel.leadingAnchor.constraint(equalTo: tempLabel.trailingAnchor),
            degreeSelsiumLabel.heightAnchor.constraint(equalToConstant: 25),
            
            
            feelsLikeLabel.topAnchor.constraint(equalTo: tempLabel.bottomAnchor, constant: 4),
            feelsLikeLabel.leadingAnchor.constraint(equalTo: todayLabel.leadingAnchor),
            feelsLikeLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
            locationImageView.topAnchor.constraint(equalTo: feelsLikeLabel.bottomAnchor, constant: 8),
            locationImageView.leadingAnchor.constraint(equalTo: todayLabel.leadingAnchor),
            locationImageView.heightAnchor.constraint(equalToConstant: 23),
            locationImageView.widthAnchor.constraint(equalToConstant: 23),
            
            
            locationLabel.topAnchor.constraint(equalTo: locationImageView.topAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 4),
            locationLabel.heightAnchor.constraint(equalTo: locationImageView.heightAnchor),
            
            
            dateLabel.centerYAnchor.constraint(equalTo: todayLabel.centerYAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -24),
            dateLabel.heightAnchor.constraint(equalTo: todayLabel.heightAnchor),
            dateLabel.widthAnchor.constraint(equalToConstant: 120),
            
            
            iconImageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 8),
            iconImageView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -28),
            iconImageView.heightAnchor.constraint(equalToConstant: 90),
            iconImageView.widthAnchor.constraint(equalToConstant: 100),
            
            
            topCollectionView.bottomAnchor.constraint(equalTo: topView.bottomAnchor, constant: -20),
            topCollectionView.leadingAnchor.constraint(equalTo: topView.leadingAnchor, constant: 24),
            topCollectionView.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -24),
            topCollectionView.heightAnchor.constraint(equalToConstant: 66),
            
            
            daysForecastLabel.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 28),
            daysForecastLabel.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 16),
            daysForecastLabel.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -16),
            daysForecastLabel.heightAnchor.constraint(equalToConstant: 24),
            
            
            daysCollectionView.topAnchor.constraint(equalTo: daysForecastLabel.bottomAnchor, constant: 28),
            daysCollectionView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor),
            daysCollectionView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor),
            daysCollectionView.heightAnchor.constraint(equalToConstant: 230)
         
        ])
        
        
        loadData()
        
        topCollectionView.register(TopCollectionCell.self, forCellWithReuseIdentifier: topCellID)
        daysCollectionView.register(DaysCollectionCell.self, forCellWithReuseIdentifier: daysCellID)
    }
    
    func loadData() {
        viewModel.getCurrentData {
            self.currentConditions = self.viewModel.currentWeather.currentConditions
            self.configure()
            self.loadTopCollViewArray()
            self.daysCollectionViewData = self.viewModel.currentWeather.days ?? []
            
            DispatchQueue.main.async {
                self.topCollectionView.reloadData()
                self.daysCollectionView.reloadData()
            }
        }
    }
    
    func loadTopCollViewArray() {
        
        if self.currentConditions != nil {
            topCellData.removeAll()
            topCellData.append(TopViewCellModel(image: "wind", label1: "Wind", label2: "\(currentConditions?.windspeed ?? 0.0) km/h"))
            topCellData.append(TopViewCellModel(image: "drop.fill", label1: "Humidity", label2: "\(currentConditions?.humidity ?? 0.0)%"))
            topCellData.append(TopViewCellModel(image: "eye.fill", label1: "Visibility", label2: "\(Int(currentConditions?.visibility ?? 0.0))KM"))
            topCellData.append(TopViewCellModel(image: "rectangle.compress.vertical", label1: "Pressure", label2: String(currentConditions?.pressure ?? 0.0)))
        }
        
    }
    
    
    func configure() {
        //°C
        self.citynameLabel.text = viewModel.cityName
        self.todayLabel.text = "Today"
        self.tempLabel.text = "\(currentConditions?.temp ?? 0.0)"
        self.degreeSelsiumLabel.text = "°C"
        self.feelsLikeLabel.text = "Feels like \(currentConditions?.feelslike ?? 0.0)°C"
        self.locationImageView.image = UIImage(named: "map")
        self.iconImageView.loadImage(imageURL: "\(currentConditions?.icon ?? "")")
        self.locationLabel.text = viewModel.cityName
        self.dateLabel.dateToString(text: "\(viewModel.currentWeather?.days![0].datetime ?? "2022-11-11")")
    }
    
  
    
    @objc func locationTapped() {
      loadData()
    }

    
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topCollectionView {
            return topCellData.count
        } else {
            return daysCollectionViewData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topCollectionView {
            let cell1 = topCollectionView.dequeueReusableCell(withReuseIdentifier: topCellID, for: indexPath) as! TopCollectionCell
            cell1.configure(data: topCellData[indexPath.item])
            return cell1
        } else {
            let cell2 = daysCollectionView.dequeueReusableCell(withReuseIdentifier: daysCellID, for: indexPath) as! DaysCollectionCell
        
                cell2.configure(data: daysCollectionViewData[indexPath.item])
            return cell2
        }
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == topCollectionView {
            return CGSize(width: (topCollectionView.frame.height) * 1.2, height: topCollectionView.frame.height)
        } else {
            return CGSize(width: 124, height: daysCollectionView.frame.height)
        }
        
    }
    
}

