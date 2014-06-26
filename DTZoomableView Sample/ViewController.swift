//
//  ViewController.swift
//  DTZoomableView Sample
//
//  Created by Dimitris-Sotiris Tsolis on 24/6/14.
//  Copyright (c) 2014 DFG-Team. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let zoomableView: DTZoomableView = DTZoomableView(frame: CGRectMake(10, 100, 300, 300))
        zoomableView.image = UIImage(named: "sample_image")
        self.view.addSubview(zoomableView)
    }

}

