//
//  popOverHelper.swift
//  CustomTextFieldEmoChat
//
//  Created by Nikolay Dementiev on 11.06.17.
//  Copyright © 2017 mc373. All rights reserved.
//

import UIKit

//https://stackoverflow.com/a/3732812/6643923
extension UIView {
    func firstAvailableUIViewController() -> UIViewController? {
        // convenience function for casting and to "mask" the recursive function

        guard let notNullUIViewController = self.traverseResponderChainForUIViewController() else {
            return nil
        }

        return notNullUIViewController as? UIViewController
    }

    func traverseResponderChainForUIViewController() -> Any? {
        let nextResponder = self.next

        if nextResponder is UIViewController {
            return nextResponder as! UIViewController
        } else if nextResponder is UIView {
            return (nextResponder as! UIView).traverseResponderChainForUIViewController()
        } else {
            return nil
        }
    }
}
