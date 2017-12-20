//
//  Extensions.swift
//  Audible
//
//  Created by Emre Özdil on 19.12.2017.
//  Copyright © 2017 Emre Özdil. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(r:CGFloat, g:CGFloat, b:CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    static var orange = UIColor(r: 247, g: 154, b: 27)
}
