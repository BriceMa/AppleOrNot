//
//  MonLabel.swift
//  AppleOrNot
//
//  Created by Brice on 13/03/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit

class MonLabel: UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        setup()
    }
    
    func setup()  {
        textColor = .white
        numberOfLines = 0
        textAlignment = .center
// Font s'adapte en fonctio nde la quantité
        adjustsFontSizeToFitWidth = true
        font = UIFont.systemFont(ofSize: 20)
        updateText(nil, nil)
        
    }
    
    func updateText(_ tempsRestant: Int?, _ score: Int?) {
        var texte = "Est-ce un logo Apple ? "
        if tempsRestant == nil && score == nil{
            text = texte
        }
    }
}
