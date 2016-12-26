//
//  MenuController.swift
//  Example
//
//  Created by Kosuke Matsuda on 2016/11/17.
//  Copyright © 2016年 matsuda. All rights reserved.
//

import UIKit
import DrawerTransition

final class MenuController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Menu"
        let item = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tapDone(sender:)))
        navigationItem.leftBarButtonItem = item
    }

    func tapDone(sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}

extension MenuController: DrawerTransitionDelegate {
    func shouldAutomaticallyDismissPresentatedViewController() -> Bool {
        return false
    }

    func drawerTransitionDidTapDimmingView() {
        print(#function)
        dismiss(animated: true, completion: nil)
    }
}
