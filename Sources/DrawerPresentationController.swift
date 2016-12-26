//
//  DrawerPresentationController.swift
//  DrawerTransition
//
//  Created by Kosuke Matsuda on 2016/11/17.
//  Copyright © 2016年 Appirits. All rights reserved.
//

import UIKit

class DrawerPresentationController: UIPresentationController {
    weak var transitionDelegate: DrawerTransitionDelegate?

    var scale: Double = 0.8

    fileprivate let dimmingView = UIView()

    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        prepareOverlay()
    }

    override func presentationTransitionWillBegin() {
        let containerView = self.containerView!
        dimmingView.frame = containerView.bounds
        containerView.insertSubview(dimmingView, at: 0)
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [unowned self] (context) in
            self.dimmingView.alpha = 0.5
        }, completion: { (context) in
        })
    }

    override func presentationTransitionDidEnd(_ completed: Bool) {
    }

    override func dismissalTransitionWillBegin() {
        presentedViewController.transitionCoordinator?.animate(alongsideTransition: { [unowned self] (context) in
            self.dimmingView.alpha = 0
        }, completion: { (context) in
        })
    }

    override func dismissalTransitionDidEnd(_ completed: Bool) {
        if completed {
            dimmingView.removeFromSuperview()
        }
    }

    override func containerViewWillLayoutSubviews() {
        dimmingView.frame = containerView!.bounds
        presentedView?.frame = frameOfPresentedViewInContainerView
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        let containerBounds = self.containerView!.bounds
        let childContentSize = size(forChildContentContainer: presentedViewController, withParentContainerSize: containerBounds.size)
        return CGRect(x: containerBounds.width - childContentSize.width,
                      y: 0,
                      width: childContentSize.width,
                      height: childContentSize.height)
    }

    override func size(forChildContentContainer container: UIContentContainer, withParentContainerSize parentSize: CGSize) -> CGSize {
        var size = parentSize
        size.width *= CGFloat(scale)
        return size
    }

    private func prepareOverlay() {
        dimmingView.backgroundColor = UIColor.black
        dimmingView.alpha = 0
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapOverlay(gesture:)))
        dimmingView.addGestureRecognizer(gesture)
    }

    func didTapOverlay(gesture: UIGestureRecognizer) {
        var dismiss: Bool = true
        if let delegate = transitionDelegate {
            delegate.drawerTransitionDidTapDimmingView()
            dismiss = delegate.shouldAutomaticallyDismissPresentatedViewController()
        }
        if dismiss {
            presentedViewController.dismiss(animated: true, completion: nil)
        }
    }
}
