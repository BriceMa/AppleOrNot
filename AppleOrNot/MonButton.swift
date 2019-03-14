//
//  MonButton.swift
//  AppleOrNot
//
//  Created by Brice on 13/03/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit

class MonButton: UIButton {

    func setup(string: String) {
        setLayer()
        setTitle(string, for: UIControl.State.normal)
        setTitleColor(UIColor.darkGray, for: .normal)
    }
}
