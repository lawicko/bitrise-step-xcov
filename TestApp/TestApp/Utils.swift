//
//  Utils.swift
//  TestApp
//
//  Created by Jakub Lawicki on 30 Apr 20.
//  Copyright © 2020 Secret Inc. All rights reserved.
//

import UIKit

func getSubviewsOf<T : UIView>(_ view:UIView) -> [T] {
    var subviews = [T]()

    for subview in view.subviews {
        subviews += getSubviewsOf(subview) as [T]

        if let subview = subview as? T {
            subviews.append(subview)
        }
    }

    return subviews
}
