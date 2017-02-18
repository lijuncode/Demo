//
//  MovieTableViewCell.swift
//  Swift_TableView
//
//  Created by  李俊 on 2017/2/18.
//  Copyright © 2017年 Lijun. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

  let avatarImageView = UIImageView()
  let userNameLabel = UILabel()

  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    avatarImageView.contentMode = .scaleAspectFill
    contentView.addSubview(avatarImageView)

    userNameLabel.textColor = UIColor.lightText
    userNameLabel.font = UIFont.systemFont(ofSize: 15)
    contentView.addSubview(userNameLabel)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
