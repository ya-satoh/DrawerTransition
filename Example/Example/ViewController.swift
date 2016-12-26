//
//  ViewController.swift
//  Example
//
//  Created by Kosuke Matsuda on 2016/11/17.
//  Copyright © 2016年 matsuda. All rights reserved.
//

import UIKit
import DrawerTransition

class ViewController: UIViewController {

    lazy var transition: UIViewControllerTransitioningDelegate = {
        let transition = DrawerTransition()
        return transition
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "DrawerTransition"
        let item = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(tapDrawerButton(sender:)))
        navigationItem.rightBarButtonItem = item
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tapDrawerButton(sender: UIBarButtonItem) {
        let navi = storyboard?.instantiateViewController(withIdentifier: "MenuNavigation") as! UINavigationController
        navi.modalPresentationStyle = .custom
        navi.transitioningDelegate = transition
        let vc = navi.viewControllers.first as! MenuController
        (transition as! DrawerTransition).delegate = vc
        present(navi, animated: true, completion: nil)
    }
}
