//
//  LayoutProtocol.swift
//  Protocol-UIView
//
//  Created by  李俊 on 2017/2/19.
//  Copyright © 2017年 Lijun. All rights reserved.
//

import UIKit

protocol Layout {

  // 计算size
  func sizeThatFits(_ size: CGSize) -> CGSize

  // 设置frame
  mutating func layoutViews(in rect: CGRect)
}
