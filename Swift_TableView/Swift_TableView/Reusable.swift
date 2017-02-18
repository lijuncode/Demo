//
//  Reusable.swift
//  Swift_TableView
//
//  Created by  李俊 on 2017/2/18.
//  Copyright © 2017年 Lijun. All rights reserved.
//

import UIKit


public struct ReusableIdentifier <T> {
  public let identifier: String

  public init() {
    self.init(identifier: String(describing: T.self))
  }

  public init(identifier: String) {
    self.identifier = identifier
  }
}

// MARK: - UITableView Extension

public extension UITableView {

  func register<T: UITableViewCell>(_ rid: ReusableIdentifier<T>) {
    self.register(T.self, forCellReuseIdentifier: rid.identifier)
  }

  func dequeue<T: UITableViewCell>(_ rid: ReusableIdentifier<T>, indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: rid.identifier, for: indexPath) as? T else {
      assertionFailure("No identifier(\(rid.identifier)) found for \(T.self)")
      return T.init()
    }
    return cell
  }

  func register<T: UITableViewCell>(_: T.Type) {
    register(ReusableIdentifier<T>())
  }

  func dequeue<T: UITableViewCell>(_ indexPath: IndexPath) -> T {
    return dequeue(ReusableIdentifier<T>(), indexPath: indexPath)
  }

}


