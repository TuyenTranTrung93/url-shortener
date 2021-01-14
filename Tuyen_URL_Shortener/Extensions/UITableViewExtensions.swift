//
//  UITableViewExtensions.swift
//  Tuyen_URL_Shortener
//
//  Created by Tuyen Tran on 1/13/21.
//

import Foundation
import UIKit

extension UITableView {
    
    public func registerClass(of cell: UITableViewCell.Type) {
        register(cell, forCellReuseIdentifier: cell.identifier)
    }
    
    public func registerNib(of cell: UITableViewCell.Type) {
        register(cell.nib, forCellReuseIdentifier: cell.identifier)
    }
    
    public func dequeueReusableCell<T: UITableViewCell>(cellClass: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellClass.identifier, for: indexPath) as? T else {
            fatalError("Can't dequeue reusable cell with \(T.description())")
        }
        return cell
    }
    
    public func dequeueReusableView<T: UITableViewHeaderFooterView>(_ view: T.Type) -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: view.identifier) as? T else {
            fatalError("Can't dequeue reusable view with \(T.description())")
        }
        return view
    }
    
}
