//
//  MainListViewController.swift
//  OpenWeatherApp
//
//  Created by Grace Njoroge on 03/12/2019.
//  Copyright © 2019 Grace. All rights reserved.
//

import UIKit

class MainListTableView: UIViewController {
  
  private let viewModel = WeatherViewModel()
  
  lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.delegate = self
    tableView.dataSource = self
    return tableView
  }()

    override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = .white
      self.title = "Weather"

      tableView.register(CityTableViewCell.self, forCellReuseIdentifier: CityTableViewCell.reuseIdentifier)
      setupTableViewConstraints()
      
      attemptWeatherFetch()
    }
  
  fileprivate func setupTableViewConstraints() {
    view.addSubview(tableView)

    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.topAnchor),
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  private func attemptWeatherFetch() {
    viewModel.fetchWeather { (weather) in
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }
  
}

extension MainListTableView: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CityTableViewCell.reuseIdentifier, for: indexPath) as! CityTableViewCell
    
    cell.cityNameLabel.text  = viewModel.cityName
    cell.temperatureLabel.text = "\(viewModel.temperature) K"
    cell.weatherIconImageView.kf.setImage(with: viewModel.weatherIconUrl)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
}
