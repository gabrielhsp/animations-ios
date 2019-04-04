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
    
    var isExpanded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        boxView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(gesture:))))
    }
    
    @objc func handleTap(gesture: UITapGestureRecognizer) {
        self.isExpanded = !isExpanded
        
        let height: CGFloat = isExpanded ? 300 : 50
        
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

