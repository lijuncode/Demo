//
//  ViewController.swift
//  Protocol-UIView
//
//  Created by  李俊 on 2017/2/18.
//  Copyright © 2017年 Lijun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let contentView = ContentView()
  override func viewDidLoad() {
    super.viewDidLoad()

    contentView.imageView.image = UIImage(named: "image")
    contentView.textLabel.text = "中国古代政治自秦汉而至清朝，其发展演变的一大趋势就是，皇帝越来越集权专制，一方面是中央收地方之权，把权力都集中到中央政府，另一方面是皇帝收中央政府之权，把权力都集中到皇帝手上，最终就是全国的军政权力都集中到皇帝一人手上。"
    view.addSubview(contentView)
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    let size = contentView.sizeThatFits(CGSize(width: 300, height: 100))
    let point = CGPoint(x: 20, y: 50)
    contentView.frame = CGRect(origin: point, size: size)
  }

  @IBAction func topImage(_ sender: Any) {
    contentView.layoutType = .topImage
    view.setNeedsLayout()
  }

  @IBAction func leftImage(_ sender: Any) {
    contentView.layoutType = .leftImage
    view.setNeedsLayout()
  }

  @IBAction func bottomImage(_ sender: Any) {
    contentView.layoutType = .bottomImage
    view.setNeedsLayout()
  }

  @IBAction func rightImage(_ sender: Any) {
    contentView.layoutType = .rightImage
    view.setNeedsLayout()
  }
}

