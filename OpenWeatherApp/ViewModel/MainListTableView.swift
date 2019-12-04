//
//  MainListViewController.swift
//  OpenWeatherApp
//
//  Created by Grace Njoroge on 03/12/2019.
//  Copyright © 2019 Grace. All rights reserved.
//

import UIKit

class MainListTableView: UIViewController {
  
  let cellID = "cell"
  
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
      
      tableView.register(CityTableViewCell.self, forCellReuseIdentifier: cellID)
      setupTableViewConstraints()
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
}

extension MainListTableView: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! CityTableViewCell
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
}
