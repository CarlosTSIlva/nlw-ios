//
//  HomeView.swift
//  nlw
//
//  Created by Carlos Eduardo Teixeira Silva on 2024-12-12.
//

import Foundation
import UIKit
import MapKit



class HomeView: UIView {
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    private let filterScrollView: UIScrollView = {
       let scrowView = UIScrollView()
        scrowView.translatesAutoresizingMaskIntoConstraints = false
        scrowView.showsHorizontalScrollIndicator = false
        scrowView.isUserInteractionEnabled = true
        
        return scrowView
    }()
    
    private let containerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Colors.gray100
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        
        return view
    }()
    
    private let dragIndicatorrView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 3
        view.backgroundColor = Colors.gray300
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Explore locais perto de você"
        label.font = Typography.textMD
        label.textColor = Colors.gray600
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let filterStacikView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.isUserInteractionEnabled = true
        stackView.spacing = 9
        stackView.distribution = .fill
        
        return stackView
    }()
    
    private let placesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PlaceTableViewCell.self, forCellReuseIdentifier: PlaceTableViewCell.identifier)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var containerTopConstraint: NSLayoutConstraint!
    
    private func setupUI() {
        addSubview(mapView)
        addSubview(filterScrollView)
        addSubview(containerView)
            
        filterScrollView.addSubview(filterStacikView)
        
        containerView.addSubview(dragIndicatorrView)
        containerView.addSubview(descriptionLabel)
        containerView.addSubview(placesTableView)
        
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mapView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.65),
            
            filterScrollView.topAnchor.constraint(equalTo: topAnchor,constant: 48),
            filterScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            filterScrollView.leadingAnchor.constraint(equalTo: trailingAnchor),
            filterScrollView.heightAnchor.constraint(equalToConstant: 86),
            
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            filterStacikView.topAnchor.constraint(equalTo: filterScrollView.bottomAnchor),
            filterStacikView.leadingAnchor.constraint(equalTo: filterScrollView.leadingAnchor),
            filterStacikView.trailingAnchor.constraint(equalTo: filterScrollView.trailingAnchor),
            filterStacikView.bottomAnchor.constraint(equalTo: filterScrollView.bottomAnchor),
            filterStacikView.heightAnchor.constraint(equalTo: filterScrollView.heightAnchor)
        ])
        
        containerTopConstraint = containerView.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -16)
        containerTopConstraint.isActive = true
        
        NSLayoutConstraint.activate([
            dragIndicatorrView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            dragIndicatorrView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            dragIndicatorrView.widthAnchor.constraint(equalToConstant: 80),
            dragIndicatorrView.heightAnchor.constraint(equalToConstant: 4),
            
            descriptionLabel.topAnchor.constraint(equalTo: dragIndicatorrView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            
            placesTableView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            placesTableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 24),
            placesTableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -24),
            placesTableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
            
        ])
    }
    
    func configureTableViewDelegate(_ delegate: UITableViewDelegate, datasource: UITableViewDataSource) {
        placesTableView.delegate = delegate
        placesTableView.dataSource = datasource
    }
}



