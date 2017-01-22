//
//  ViewController.swift
//  Swift_ios8_tableView
//
//  Created by  李俊 on 2017/1/21.
//  Copyright © 2017年 Lijun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var goOCVCBtn: UIButton!
  @IBOutlet weak var goSwiftVCBtn: UIButton!

  let movies: [Movie] = {
    var movies = [Movie]()
    let path = Bundle.main.path(forResource: "movie_data", ofType: "json")
    let str = try? String(contentsOfFile: path!, encoding: String.Encoding.utf8)
    let data = str?.data(using: .utf8)!
    let obj = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)

    if let movieDics = obj as? [[String: String]] {
      for movieDic in movieDics {
        let movie = Movie(name: movieDic["suggestion"]!, intro: movieDic["content"]!)
        movies.append(movie)
      }
    }

    return movies
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

  @IBAction func gotoSwiftVC(_ sender: Any) {
    let vc = MoviesSwiftTableViewController()
    vc.movies = movies
    navigationController?.pushViewController(vc, animated: true)
  }

  @IBAction func gotoOCVC(_ sender: Any) {
    let vc = MoviesOCTableViewController()
    vc.movies = movies
    navigationController?.pushViewController(vc, animated: true)
  }

}

class Movie: NSObject {
  let name: String
  let intro: String

  init(name: String, intro: String) {
    self.name = name
    self.intro = intro
    super.init()
  }
}



