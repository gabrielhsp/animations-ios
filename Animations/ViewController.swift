//
//  ViewController.swift
//  Animations
//
//  Created by Gabriel Henrique Santos Pereira on 04/04/19.
//  Copyright © 2019 Gabriel Henrique Santos Pereira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var viewDeFora: UIView!
    @IBOutlet weak var boxView: UIView!
    @IBOutlet weak var boxHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var customButton: UIButton!
    
    @IBOutlet weak var loadingViewDeFora: UIView!
    @IBOutlet weak var loadingViewDeDentro: UIView!
    
    var isExpanded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boxView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(gesture:))))
        
        loadingViewDeFora.addGestureRecognizer(UITapGestureRecognizer(target: self
            , action: #selector(loadingViewTap(_ :))))
    }
    
    @objc func loadingViewTap(_ gesture: UITapGestureRecognizer?) {
        UIView.animate(withDuration: 0.5, delay: 0.3, options: [.curveEaseIn], animations: {
            self.loadingViewDeDentro.frame = CGRect(x: 0, y: 0, width: self.loadingViewDeFora.frame.size.width, height: 15)
        }) { (finished) in
            UIView.animate(withDuration: 0.5, delay: 0.5, options: [.curveEaseIn], animations: {
                self.loadingViewDeDentro.frame = CGRect(x: UIScreen.main.bounds.width, y: 0, width: 30, height: 15)
            }, completion: { finished in
                self.loadingViewDeDentro.frame = CGRect(x: -100, y: 0, width: 0, height: 15)
                self.loadingViewTap(nil)
            })
        }
    }	
    
    @objc func handleTap(gesture: UITapGestureRecognizer) {
        self.isExpanded = !isExpanded
        
        let height: CGFloat = isExpanded ? 200 : 50
        
        UIView.animate(withDuration: 0.5) {
            self.boxHeightConstraint.constant = height
            self.viewDeFora.layoutIfNeeded()
        }
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        UIView.animate(withDuration: 0.2, animations: {
            self.customButton.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
        }) { finished in
            UIView.animate(withDuration: 0.2, animations: {
                self.customButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        }
    }
}

