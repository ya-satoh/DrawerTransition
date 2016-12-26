//
//  DrawerTransitionDelegate.swift
//  DrawerTransition
//
//  Created by Kosuke Matsuda on 2016/12/26.
//  Copyright © 2016年 matsuda. All rights reserved.
//

import Foundation

// MARK: - DrawerTransitionDelegate

public protocol DrawerTransitionDelegate: NSObjectProtocol {
    func shouldAutomaticallyDismissPresentatedViewController() -> Bool
    func drawerTransitionDidTapDimmingView()
}

public extension DrawerTransitionDelegate {
    func shouldAutomaticallyDismissPresentatedViewController() -> Bool {
        return true
    }
}
