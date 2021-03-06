//
//  UserDetailView.swift
//  TeamBite
//
//  Created by Margiett Gil on 4/21/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import UIKit
import MapKit

class UserDetailView: UIView {
    
    lazy var contentViewSize = CGSize(width: centerView.frame.width , height: centerView.frame.height + 400)
    
    public lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.frame = self.bounds
        
        view.contentSize = CGSize(width: (self.frame.width * 0.100), height: (self.frame.height * 0.700))
        view.backgroundColor = .white
        return view
    }()
    
    public var centerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
        
    }()

    public lazy var restaurantPhoto: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo.fill")
        imageView.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    // ADDRESS LABEL
    public lazy var addressLabel: UILabel = {
        let layout = UILabel()
        layout.text = "FILLER ADDRESS"
        layout.numberOfLines = 2
        layout.font = UIFont(name: "Hiragino Mincho ProN", size: 15)
        layout.textColor = .black
        layout.textAlignment = .left
        return layout
    }()
    
    public lazy var phoneNumberLabel: UILabel = {
        let layout = UILabel()
        layout.text = "FILLER Phone"
        layout.numberOfLines = 2
        layout.font = UIFont(name: "Hiragino Mincho ProN", size: 15)
        layout.textColor = .black
        layout.textAlignment = .left
        return layout
        
    }()
    
    public lazy var restaurantInfo: UILabel = {
        let layout = UILabel()
    //    layout.text = "FILLER ADDRESS"
        layout.numberOfLines = 0
        layout.font = UIFont(name: "Hiragino Mincho ProN", size: 15)
        layout.textColor = .black
        layout.textAlignment = .left
        return layout
        
    }()
    
    public lazy var hoursOFOperation: UILabel = {
        let layout = UILabel()
        layout.text = "FILLER Hours"
        layout.numberOfLines = 0
        layout.font = UIFont(name: "Hiragino Mincho ProN", size: 15)
        layout.textColor = .black
        layout.textAlignment = .left
        return layout
    }()
    
    public lazy var numberOfMeals: UILabel = {
        let layout = UILabel()
        layout.numberOfLines = 0
        layout.font = UIFont(name: "Hiragino Mincho ProN", size: 15)
        layout.textColor = .black
        layout.textAlignment = .left
        return layout
    }()
    
    public lazy var claimButton: UIButton = {
        let button = UIButton()
        button.setTitle("Claim Meal", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        button.layer.cornerRadius = 5.0
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        return button
    }()
    
    public lazy var locationMap: MKMapView = {
        let map = MKMapView()
        map.layer.borderColor = UIColor.black.cgColor
        map.layer.borderWidth = 1
        return map
    }()
    
    public lazy var getDirectionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Get Directions", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        button.layer.cornerRadius = 5.0
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.semibold)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    public lazy var activeOffersLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Active Offers"
        return label
    }()
    
    public lazy var offersTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(PatronOfferCell.self, forCellReuseIdentifier: "offerCell")
        tableView.layer.borderWidth = 1.0
        tableView.layer.borderColor = UIColor.black.cgColor
//        tableView.separatorStyle = .none
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit() {
//        setupScrollView()
//        setupCenterView()
   //     configImage()
        setupVenueAddress()
        setupPhoneNumber()
//        setupHours()
//        setupMap()
//        setupGetDirection()
        setUpActiveOffersLabelConstraints()
        setUpOffersTableViewConstraints()
//        setupButton()
//        setupRestaurantInfo()
//        setupHours()
//        setupNumberOfMeals()
    }
    
    private func setupCenterView() {
        scrollView.addSubview(centerView)
        centerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            centerView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
            centerView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            centerView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        ])
    }
    
    private func setupScrollView(){
        addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let width = self.bounds.width
        let height = self.bounds.height * 400
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: centerXAnchor),
            scrollView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
            scrollView.widthAnchor.constraint(equalToConstant: width),
            scrollView.heightAnchor.constraint(equalToConstant: height)
        ])
        
    }
    private func configImage() { // This is an image
        centerView.addSubview(restaurantPhoto)
        restaurantPhoto.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            restaurantPhoto.centerXAnchor.constraint(equalTo: centerXAnchor),
            restaurantPhoto.centerYAnchor.constraint(equalTo: centerYAnchor),
            restaurantPhoto.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.12),
            restaurantPhoto.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.12)
        ])
    }
    
    private func setupRestaurantInfo() { // this is a label
        centerView.addSubview(restaurantInfo)
        restaurantInfo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            restaurantInfo.topAnchor.constraint(equalTo: restaurantPhoto.bottomAnchor, constant: 8),
            restaurantInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            restaurantInfo.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -8),
        ])
    }
    
 
    
    private func setupNumberOfMeals() { // This is a Label
        centerView.addSubview(numberOfMeals)
        numberOfMeals.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            numberOfMeals.topAnchor.constraint(equalTo: hoursOFOperation.bottomAnchor, constant: 8),
            numberOfMeals.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            numberOfMeals.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            
        ])
        
    }
    
    private func setupVenueAddress() {
        addSubview(addressLabel)
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            
        ])
    }
    
    
    private func setupPhoneNumber() {
        addSubview(phoneNumberLabel)
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneNumberLabel.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant:  10),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
            
        ])
    }
    
    
    private func setupHours() { // This is a Label
        addSubview(hoursOFOperation)
        hoursOFOperation.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hoursOFOperation.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 10),
            hoursOFOperation.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            hoursOFOperation.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
        ])
    }
    
    
    private func setupMap() {
        addSubview(locationMap)
        locationMap.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            locationMap.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 15),
            locationMap.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
            locationMap.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
            locationMap.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.35)
            
        ])
    }
    
    private func setupButton() {
        addSubview(claimButton)
        claimButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            claimButton.topAnchor.constraint(equalTo: getDirectionButton.bottomAnchor, constant: 15),
            claimButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            claimButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            //                claimButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            //                claimButton.centerYAnchor.constraint(equalTo: centerYAnchor)
            
        ])
    }
    
    private func setupGetDirection() {
        addSubview(getDirectionButton)
        getDirectionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            getDirectionButton.topAnchor.constraint(equalTo: locationMap.bottomAnchor, constant: 30),
            getDirectionButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            getDirectionButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            //                getDirectionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            //                getDirectionButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func setUpActiveOffersLabelConstraints() {
        addSubview(activeOffersLabel)
        activeOffersLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([activeOffersLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 20), activeOffersLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), activeOffersLabel.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8)])
    }
    
    private func setUpOffersTableViewConstraints() {
        addSubview(offersTableView)
        offersTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([offersTableView.topAnchor.constraint(equalTo: activeOffersLabel.bottomAnchor, constant: 20), offersTableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), offersTableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8), offersTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -8)])
    }
    
    
}
