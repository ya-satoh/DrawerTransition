//
//  MenuController.swift
//  Example
//
//  Created by Kosuke Matsuda on 2016/11/17.
//  Copyright © 2016年 matsuda. All rights reserved.
//

import UIKit

class MenuController: UIViewController {

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
