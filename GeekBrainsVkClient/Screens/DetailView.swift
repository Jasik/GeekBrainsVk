//
//  DetailView.swift
//  GeekBrainsVkClient
//
//  Created by Vladimir Rogozhkin on 2020/02/07.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class DetailView: UIViewController {
    
    private var interactiveAnimator: UIViewPropertyAnimator!
    
    var photos:[String] = []
    
    private let viewContaiter = UIView()
    
    private var curImageView = UIView()
    private var curImageFrame = CGRect()
    
    private var selectedImage = 0
    private var previousImage = 0
    
    private var width: CGFloat = 0
    private var height: CGFloat = 0
    
    private var offsetValue: CGFloat = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGesture()
        setImage()
        setImageViews()
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.title = "Photos"
    }
    
    private func setupGesture() {
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        self.view.addGestureRecognizer(leftSwipe)
        self.view.addGestureRecognizer(rightSwipe)
    }
    
    private func setImageViews() {
        
        width = self.view.frame.width
        height = self.view.frame.height

        viewContaiter.frame = CGRect(x: 0, y: 0, width: width * CGFloat(photos.count), height: height)

        for (i, photo) in photos.enumerated() {
            let iv = UIImageView()
            iv.frame = CGRect(x: width * CGFloat(i), y: 0, width: width, height: height)
            iv.contentMode = .scaleAspectFit
            iv.image = UIImage(named: photo)
            iv.tag = i
            viewContaiter.addSubview(iv)
        }

        self.view.addSubview(viewContaiter)
    }
    private func setImage() {
        
        UIView.animate(withDuration: 0, delay: 0, options: [], animations: {
            self.viewContaiter.frame.origin.x = -(self.width * CGFloat(self.selectedImage))
        })
    }
    
    private func setCurrentImage() {
        
        var previousView = UIView()
        var previousFrame = CGRect()
        for view in viewContaiter.subviews {
            if view.tag == previousImage {
                previousView = view
                previousFrame = view.frame
                break
            }
        }
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [], animations: {
    
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.1, animations: {
                previousView.frame = CGRect(x: previousFrame.origin.x + self.offsetValue, y: previousFrame.origin.y + self.offsetValue, width: previousFrame.width - self.offsetValue * 2, height: previousFrame.height - self.offsetValue * 2)
            })
               
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.viewContaiter.frame.origin.x = -(self.width * CGFloat(self.selectedImage))
            })
               
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0, animations: {
                previousView.frame = previousFrame
            })
        }, completion: nil)
    }
    
    @objc func handleSwipes(_ sender: UISwipeGestureRecognizer) {
        
        if sender.direction == UISwipeGestureRecognizer.Direction.right {
            if (selectedImage - 1 >= 0) {
                previousImage = selectedImage
                selectedImage -= 1
            }
        }
            
        else if sender.direction == UISwipeGestureRecognizer.Direction.left {
            if (selectedImage + 1 < photos.count) {
                previousImage = selectedImage
                selectedImage += 1
            }
        }
    
        self.setCurrentImage()
    }
}
