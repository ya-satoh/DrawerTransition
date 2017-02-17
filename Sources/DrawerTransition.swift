//
//  DrawerTransition.swift
//  DrawerTransition
//
//  Created by Kosuke Matsuda on 2016/11/17.
//  Copyright © 2016年 matsuda. All rights reserved.
//

import UIKit

public class DrawerTransition: NSObject, UIViewControllerTransitioningDelegate {
    public weak var delegate: DrawerTransitionDelegate?
    public var scale: Double = 0.7

    convenience init(scale: Double) {
        self.init()
        self.scale = scale
    }

    public func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentation = DrawerPresentationController(presentedViewController: presented, presenting: presenting)
        presentation.scale = scale
        presentation.transitionDelegate = delegate
        return presentation
    }

    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DrawerAnimatedTransitioning(isPresent: true)
    }

    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DrawerAnimatedTransitioning(isPresent: false)
    }
}
