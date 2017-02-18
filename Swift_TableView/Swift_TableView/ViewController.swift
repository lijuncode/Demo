//
//  ViewController.swift
//  Swift_TableView
//
//  Created by  李俊 on 2017/2/18.
//  Copyright © 2017年 Lijun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let recommendMovies: [RecommendMovie] = loadRecommendMovies()
  let tableView = UITableView(frame: .zero, style: .plain)

  override func viewDidLoad() {
    super.viewDidLoad()
    title = "测试"
    view.addSubview(tableView)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    tableView.frame = view.bounds
  }

}

func loadRecommendMovies() -> [RecommendMovie] {
  let path = Bundle.main.path(forResource: "test_data", ofType: "json")
  let str = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
  let data = str.data(using: .utf8)!
  let obj = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers)
  var movies = [RecommendMovie]()
  if let dics = obj as? [[String: Any]] {
    for dic in dics {
      let userName = dic["user_name"] as! String
      let content = dic["content"] as! String
      let movie = dic["suggestion"] as! String
      let layout = LayoutType(rawValue: dic["layout"] as! Int) ?? .noImage
      movies.append(RecommendMovie(userName: userName, movieName: movie, recommendReason: content, layoutType: layout))
    }
  }
  return movies
}

