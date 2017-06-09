//
//  PopUpVievController.swift
//  CustomTextFieldEmoChat
//
//  Created by Nikolay Dementiev on 09.06.17.
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
////MARK:- extension UIViewController
//extension UIViewController: UIPopoverPresentationControllerDelegate {
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "sowPopUpInfo" {
//            let popoverViewController = segue.destination as! PopUpViewController
//
//            popoverViewController.modalPresentationStyle = UIModalPresentationStyle.popover
//            popoverViewController.popoverPresentationController!.delegate = self
//        }
//    }
//
//}


//MARK:- PopUpVievController
class PopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {

        return UIModalPresentationStyle.none
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
