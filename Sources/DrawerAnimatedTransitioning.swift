//
//  DrawerAnimatedTransitioning.swift
//  DrawerTransition
//
//  Created by Kosuke Matsuda on 2016/11/17.
//  Copyright © 2016年 Appirits. All rights reserved.
//

import UIKit

class DrawerAnimatedTransitioning: NSObject, UIViewControllerAnimatedTransitioning {

    let isPresent: Bool
    var duration: TimeInterval = 0.5

    init(isPresent: Bool) {
        self.isPresent = isPresent
    }

    init(isPresent: Bool, duration: TimeInterval) {
        self.isPresent = isPresent
        self.duration = duration
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if isPresent {
            presentDrawer(using: transitionContext)
        } else {
            dismissDrawer(using: transitionContext)
        }
    }

    fileprivate func presentDrawer(using transitionContext: UIViewControllerContextTransitioning) {
        guard let destination = transitionContext.viewController(forKey: .to)
            else { return }
        let containerView = transitionContext.containerView
        let endFrame = transitionContext.finalFrame(for: destination)
        var startFrame = endFrame
        startFrame.origin.x = containerView.bounds.width
        destination.view.frame = startFrame
        containerView.addSubview(destination.view)

        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: [.curveEaseInOut, .layoutSubviews], animations: {
            // destination.view.frame.origin.x -= containerView.bounds.width
            destination.view.frame = endFrame
        }) { (finished) in
            transitionContext.completeTransition(finished)
        }
    }

    fileprivate func dismissDrawer(using transitionContext: UIViewControllerContextTransitioning) {
        guard let source = transitionContext.viewController(forKey: .from)
            else { return }
        let containerView = transitionContext.containerView
        let startFrame = transitionContext.initialFrame(for: source)
        var endFrame = startFrame
        endFrame.origin.x = containerView.bounds.width

        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: [.curveEaseOut, .layoutSubviews], animations: {
            // source.view.frame.origin.x = containerView.bounds.width
            source.view.frame = endFrame
        }) { (finished) in
            transitionContext.completeTransition(finished)
        }
    }
}
