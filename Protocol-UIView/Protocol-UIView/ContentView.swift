//
//  ContentView.swift
//  Protocol-UIView
//
//  Created by  李俊 on 2017/2/18.
//  Copyright © 2017年 Lijun. All rights reserved.
//

import UIKit

enum LayoutType {
  case topImage
  case leftImage
  case bottomImage
  case rightImage
}

class ContentView: UIView {

  let imageView = UIImageView()
  let textLabel = UILabel()
  var layoutType = LayoutType.rightImage
  var layout: Layout {
    switch layoutType {
    case .topImage:
      return TopImageLayout(imageView: imageView, textView: textLabel)
    case .leftImage:
      return LeftImageLayout(imageView: imageView, textView: textLabel)
    case .bottomImage:
      return BottomImageLayout(imageView: imageView, textView: textLabel)
    case .rightImage:
      return RightImageLayout(imageView: imageView, textView: textLabel)
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    addSubview(imageView)
    textLabel.numberOfLines = 0
    addSubview(textLabel)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func sizeThatFits(_ size: CGSize) -> CGSize {
    return layout.sizeThatFits(size)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    var contentLayout = layout
    contentLayout.layoutViews(in: bounds)
  }
}
