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
}

