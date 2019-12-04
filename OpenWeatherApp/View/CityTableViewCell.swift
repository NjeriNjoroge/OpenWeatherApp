//
//  CityTableViewCell.swift
//  OpenWeatherApp
//
//  Created by Grace Njoroge on 03/12/2019.
//  Copyright © 2019 Grace. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
  
  lazy var cityNameLabel: UILabel = {
      let label = UILabel()
      label.text = "Nairobi"
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
  }()
  
  lazy var temperatureLabel: UILabel = {
      let label = UILabel()
      label.text = "21C"
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
  }()
  
  lazy var weatherIconImageView: UIImageView = {
      let imageView = UIImageView()
      imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "19")
      imageView.contentMode = .scaleAspectFit
      imageView.clipsToBounds = true
      imageView.layer.cornerRadius = 12.5
      return imageView
  }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupConstraints()
  }
  
  fileprivate func setupConstraints() {
    addSubview(weatherIconImageView)
    addSubview(cityNameLabel)
    addSubview(temperatureLabel)
    
    NSLayoutConstraint.activate([
      weatherIconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      weatherIconImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10),
      weatherIconImageView.widthAnchor.constraint(equalToConstant: 80),
      weatherIconImageView.heightAnchor.constraint(equalToConstant: 80),
    ])
    
    NSLayoutConstraint.activate([
      cityNameLabel.leftAnchor.constraint(equalTo: weatherIconImageView.rightAnchor, constant: 10),
      cityNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10)
    ])
    
    NSLayoutConstraint.activate([
       temperatureLabel.leftAnchor.constraint(equalTo: weatherIconImageView.rightAnchor, constant: 10),
       temperatureLabel.topAnchor.constraint(equalTo: cityNameLabel.bottomAnchor, constant: 10)
     ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
