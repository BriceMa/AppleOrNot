//
//  maVue.swift
//  AppleOrNot
//
//  Created by Brice on 13/03/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit

class maVue: UIView {
    
    var masque = UIView()
    var imageView: UIImageView?
    var reponse = Reponses.maybe
    
    var logo: Logo?{
        didSet{
            guard let l = logo else { return}
            reponse = .maybe
            if imageView == nil{
                imageView = UIImageView(frame: bounds)
                imageView?.contentMode = .scaleAspectFit
                addSubview(imageView ?? UIImageView())
            }
            imageView?.image = l.image

        }
    }

    override init(frame: CGRect) {
        super.init(frame:frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func addMask()  {
        masque = UIView(frame: bounds)
        masque.backgroundColor = .clear
        masque.alpha = 0.25
        masque.layer.cornerRadius = 10
        addSubview(masque)
    }
    
    func setup(){
        setLayer()
        isUserInteractionEnabled = true
        addMask()
    }
    
    func setMaskCouleur(_ reponse : Reponses){
        switch reponse {
        case .oui: masque.backgroundColor = .green
            
        case .non: masque.backgroundColor = .red
        case .maybe: masque.backgroundColor = .clear

        }
        self.reponse = reponse
    }

}
