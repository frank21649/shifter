//
//  ShiftSchedule.swift
//  shifter
//
//  Created by Frank Wang on 2016/8/13.
//  Copyright © 2016年 Chlorophyll. All rights reserved.
//

import UIKit

var pageArray = []

class ShiftSchedule: UIPageViewController {
    override func setViewControllers(viewControllers: [UIViewController]?, direction: UIPageViewControllerNavigationDirection, animated: Bool, completion: ((Bool) -> Void)?) {
        pageArray = ["week","Home","day"]
        
    }

}
