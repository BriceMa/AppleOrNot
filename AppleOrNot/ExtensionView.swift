//
//  ExtensionView.swift
//  AppleOrNot
//
//  Created by Brice on 13/03/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit

extension UIView{
    func setLayer() {
        backgroundColor = .white
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
//        layer.borderColor = UIColor.red.cgColor
//        layer.borderWidth = 2
    }
}
