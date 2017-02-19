//
//  Layout.swift
//  Protocol-UIView
//
//  Created by  李俊 on 2017/2/19.
//  Copyright © 2017年 Lijun. All rights reserved.
//

import UIKit

private let padding: CGFloat = 20
private let imageHeight: CGFloat = 100
private let imageTextMargin: CGFloat = 20
private let imageMinWidth: CGFloat = 90

struct TopImageLayout: Layout {
  let imageView: UIView
  let textView: UIView

  func sizeThatFits(_ size: CGSize) -> CGSize {
    let textMaxWidth = size.width - padding * 2
    let textSize = textView.sizeThatFits(CGSize(width: textMaxWidth, height: size.height))
    let height = padding + imageHeight + imageTextMargin + textSize.height
    return CGSize(width: size.width, height: height)
  }

  mutating func layoutViews(in rect: CGRect) {
    imageView.frame = CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: imageHeight)

    let textMaxWidth = rect.size.width - padding * 2
    let textSize = textView.sizeThatFits(CGSize(width: textMaxWidth, height: rect.size.height))
    textView.frame = CGRect(x: rect.minX + padding, y: imageView.frame.maxY + imageTextMargin,
                            width: textSize.width, height: textSize.height)
  }
}

struct LeftImageLayout: Layout {
  let imageView: UIView
  let textView: UIView

  func sizeThatFits(_ size: CGSize) -> CGSize {
    let textMaxWidth = size.width - imageMinWidth - imageTextMargin
    let textSize = textView.sizeThatFits(CGSize(width: textMaxWidth, height: size.height))
    let height = max(imageHeight, textSize.height)
    return CGSize(width: size.width, height: height)
  }

  mutating func layoutViews(in rect: CGRect) {
    imageView.frame = CGRect(x: rect.minX, y: rect.minY, width: imageMinWidth, height: imageHeight)

    let textMaxWidth = rect.size.width - imageMinWidth - imageTextMargin
    let textSize = textView.sizeThatFits(CGSize(width: textMaxWidth, height: rect.size.height))
    textView.frame = CGRect(x: imageView.frame.maxX + imageTextMargin, y: rect.minY,
                            width: textSize.width, height: textSize.height)
  }
}

struct BottomImageLayout: Layout {
  let imageView: UIView
  let textView: UIView

  func sizeThatFits(_ size: CGSize) -> CGSize {
    let textMaxWidth = size.width - padding * 2
    let textSize = textView.sizeThatFits(CGSize(width: textMaxWidth, height: size.height))
    let height = padding + imageHeight + imageTextMargin + textSize.height
    return CGSize(width: size.width, height: height)
  }

  mutating func layoutViews(in rect: CGRect) {
    let textMaxWidth = rect.size.width - padding * 2
    let textSize = textView.sizeThatFits(CGSize(width: textMaxWidth, height: rect.size.height))
    textView.frame = CGRect(x: rect.minX + padding, y: rect.minY + padding,
                            width: textSize.width, height: textSize.height)

    imageView.frame = CGRect(x: rect.minX, y: textView.frame.maxY + imageTextMargin, width: rect.width, height: imageHeight)
  }
}

struct RightImageLayout: Layout {
  let imageView: UIView
  let textView: UIView

  func sizeThatFits(_ size: CGSize) -> CGSize {
    let textMaxWidth = size.width - imageMinWidth - imageTextMargin
    let textSize = textView.sizeThatFits(CGSize(width: textMaxWidth, height: size.height))
    let height = max(imageHeight, textSize.height)
    return CGSize(width: size.width, height: height)
  }

  mutating func layoutViews(in rect: CGRect) {

    let textMaxWidth = rect.size.width - imageMinWidth - imageTextMargin
    let textSize = textView.sizeThatFits(CGSize(width: textMaxWidth, height: rect.size.height))
    textView.frame = CGRect(x: rect.minX, y: rect.minY,
                            width: textSize.width, height: textSize.height)

    imageView.frame = CGRect(x: textView.frame.maxX + imageTextMargin, y: rect.minY, width: imageMinWidth, height: imageHeight)
  }
}

