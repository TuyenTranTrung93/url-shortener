//
//  UIViewExtensions.swift
//  Tuyen_URL_Shortener
//
//  Created by Tuyen Tran on 1/14/21.
//

import Foundation
import UIKit

extension UIView {
    
    public class var nib: UINib {
        get {
            let nibName = String(describing: self)
            let bundle = Bundle(for: self)
            return UINib(nibName: nibName, bundle: bundle)
        }
    }
    
    public class var identifier: String {
        get {
            return String(describing: self)
        }
    }
    
}
