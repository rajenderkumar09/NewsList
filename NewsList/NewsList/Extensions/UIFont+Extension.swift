//
//  UIFont+Extension.swift
//  NewsList
//
//  Created by Rajender Sharma on 18/06/20.
//  Copyright © 2020 Rajender. All rights reserved.
//

import Foundation
import UIKit


extension UIFont {
    static func appFont(with weight: UIFont.Weight, size: CGFloat) -> UIFont {
		return UIFont.systemFont(ofSize: size, weight: weight)
    }
}
