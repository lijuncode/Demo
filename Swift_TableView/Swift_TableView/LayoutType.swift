//
//  LayoutType.swift
//  Swift_TableView
//
//  Created by  李俊 on 2017/2/18.
//  Copyright © 2017年 Lijun. All rights reserved.
//

import UIKit

enum LayoutType: Int {
  case noImage = 0
  case topImage = 1
  case rightImage = 2
  case leftImage = 3

  func reusableCellIdentifier() -> ReusableIdentifier<UITableViewCell> {
    return ReusableIdentifier<UITableViewCell>(identifier: "LayoutType\(rawValue)")
  }

  static func allTypes() -> [LayoutType] {
    return [.noImage, .topImage, .rightImage, .leftImage]
  }

  
}




