//
//  MoviesSwiftTableViewController.swift
//  Swift_ios8_tableView
//
//  Created by  李俊 on 2017/1/21.
//  Copyright © 2017年 Lijun. All rights reserved.
//

import UIKit

private let reuseIdentifier = "UITableViewCell"

class MoviesSwiftTableViewController: UITableViewController {

  var movies = [Movie]() {
    didSet {
      tableView.reloadData()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Swift-ViewController"
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
  }

  // MARK: - Table view data source

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return movies.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.text = movies[indexPath.row].intro
    return cell
  }

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let cell = UITableViewCell()
    cell.textLabel?.numberOfLines = 0
    cell.textLabel?.text = movies[indexPath.row].intro
    return cell.sizeThatFits(tableView.bounds.size).height
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.reloadRows(at: [indexPath], with: .none)
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
