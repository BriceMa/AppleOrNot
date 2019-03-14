//
//  ViewController.swift
//  AppleOrNot
//
//  Created by Brice on 22/02/2019.
//  Copyright © 2019 Brice Mangeat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var container: UIView!
    
    var carte: maVue?
    var rect = CGRect()
    var buttonOui = MonButton()
    var buttonNon = MonButton()
    var scoreLabel = MonLabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
// Put gradient bg
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, UIColor.white.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        view.bringSubviewToFront(container)
        
        container.frame = view.bounds
        
        rect = CGRect(
            x: container.frame.midX - 100,
            y: container.frame.midY - 100,
            width: 200,
            height: 200)
        carte = maVue(frame: rect)
        container.addSubview(carte ?? UIView())
        
        
// Initialisation des boutons OUI et NON
        let tiers = container.frame.width/3
        let quart = container.frame.width/4
        let hauteur:CGFloat = 50
        let y = container.frame.height - hauteur*2
        let taille = CGSize(width: tiers, height: hauteur)
        buttonOui.frame.size = taille
        buttonOui.center = CGPoint(x: quart*3, y: y)
        buttonOui.setup(string: "OUI")
        buttonOui.addTarget(self, action: #selector(oui), for: .touchUpInside)
        container.addSubview(buttonOui)
        
        buttonNon.frame.size = taille
        buttonNon.center = CGPoint(x: quart, y: y)
        buttonNon.setup(string: "NON")
        buttonNon.addTarget(self, action: #selector(non), for: .touchUpInside)
        container.addSubview(buttonNon)
        
        scoreLabel = MonLabel(frame: CGRect(x: 20, y: 10, width: container.frame.width-40, height: 60))
        container.addSubview(scoreLabel)
        setupGame()
        
    }
    func setupGame() {
        let boolRandom = Int.random(in: 0...1)%2 == 0
        carte?.logo = Logo(bool: boolRandom)
    }

    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if
            let touch = touches.first,
            touch.view == carte?.masque
        {
            let xPosition = touch.location(in: container).x
            let distance = container.frame.midX - xPosition
            let angle = -distance/360
            carte?.center.x = xPosition
            carte?.transform = CGAffineTransform(rotationAngle: angle)
            
            if distance >= 75{
                carte?.setMaskCouleur(.non)
            } else if distance <= -75{
                carte?.setMaskCouleur(.oui)
            }else{
                carte?.setMaskCouleur(.maybe)
            }
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if
            let touch = touches.first,
            touch.view == carte?.masque
        {
            carte?.transform = CGAffineTransform.identity
            carte?.frame = rect
        }
    }
    
    @objc func non() {
        print("non")
    }
    
    @objc func oui() {
        print("oui")
    }

}

