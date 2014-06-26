//
//  DTZoomableView.swift
//  DTZoomableView
//
//  Created by Dimitris-Sotiris Tsolis on 24/6/14.
//  Copyright (c) 2014 DFG-Team. All rights reserved.
//

import UIKit

@objc protocol DTZoomableViewDelegate: NSObjectProtocol {
    @optional func didDoubleTapZoomableView(zoomableView: DTZoomableView!) -> Void
}


class DTZoomableView: UIScrollView, UIScrollViewDelegate {
    
    //////////////////
    // declarations //
    //////////////////
    var zoomableDelegate: DTZoomableViewDelegate?
    var imageView: UIImageView?
    
    var image: UIImage? {
    didSet {
        if let unwrappedView = imageView {
            unwrappedView.image = image
            
            if let unwrappedImageView = self.imageView {
                unwrappedImageView.image = image
            }
        }
    }
    }
    
    
    
    ////////////////////
    // initializatons //
    ////////////////////
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    func commonInit() {
        self.delegate = self
        self.minimumZoomScale = 1.0
        self.maximumZoomScale = 5.0
        
        
        var doubleTap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("doubleTapped:"))
        doubleTap.numberOfTapsRequired = 2
        self.addGestureRecognizer(doubleTap)
    }
    
    
    ////////////
    // layout //
    ////////////
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !self.imageView {
            // init imageView for the first time
            self.imageView = UIImageView(frame: self.bounds)
            self.imageView!.contentMode = UIViewContentMode.ScaleAspectFit
            self.imageView!.autoresizingMask = .FlexibleWidth | .FlexibleHeight
            self.imageView!.setTranslatesAutoresizingMaskIntoConstraints(true)
            self.addSubview(self.imageView!)
            
            if let unwrappedImage = self.image {
                self.imageView!.image = unwrappedImage
            }
        }
    }
    
    
    
    ////////////////////
    // touch handling //
    ////////////////////
    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!) {
        if let unwrappedDelegate = self.zoomableDelegate {
            if unwrappedDelegate.respondsToSelector(Selector("didDoubleTapZoomableView:")) {
                unwrappedDelegate.didDoubleTapZoomableView!(self)
            }
        }
    }
    
    
    ////////////////
    // recognizer //
    ////////////////
    func doubleTapped(recognizer: UITapGestureRecognizer) {
        if self.zoomScale > 1.0 {
            self.setZoomScale(1.0, animated: true)
        }
        else {
            let point = recognizer.locationInView(self)
            self.zoomToRect(CGRectMake(point.x, point.y, 0, 0), animated: true)
        }
    }
    
    
    
    //////////////////
    // UIScrollView //
    //////////////////
    func scrollViewDidEndZooming(scrollView: UIScrollView!, withView view: UIView!, atScale scale: CGFloat) {
        
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return self.imageView!
    }
    
    
    
    /// Enables or not the zoom capability.
    func setZoomEnabled(enabled: Bool) {
        if enabled {
            self.maximumZoomScale = 5.0
        }
        else {
            self.maximumZoomScale = 1.0
        }
    }
    
    /// Returns 'true' if the zoom is enabled
    func isZoomEnabled() -> Bool {
        return self.maximumZoomScale > 1.0
    }
}














