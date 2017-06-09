//
//  CustomTextField2.swift
//  CustomTextFieldEmoChat
//
//  Created by Nikolay Dementiev on 08.06.17.
//  Copyright © 2017 mc373. All rights reserved.
//
//https://stackoverflow.com/a/42082398/6643923

import UIKit

@IBDesignable
class CustomTextField2: UITextField {
    var imgView: UIImageView?
    //    @IBInspectable
    var image: UIImage?
    var btnQuestion:UIButton?

    //    @IBInspectable
    var imageQuestionShowed: Bool = false {
        didSet {
            hideOrShowImageQuestion()
        }
    }

    @IBInspectable var imgLeftInset: CGFloat = 5.0
    @IBInspectable var imgTopInset: CGFloat = 3.0
    @IBInspectable var imgBottomInset: CGFloat = 3.0

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        clipsToBounds = true
        image = UIImage(named: "question")

        let weight = self.bounds.height - (imgTopInset + imgBottomInset)
        //        imgView = UIImageView(frame:
        //            CGRect(x: imgLeftInset,
        //                   y: imgTopInset,
        //                   width: weight,
        //                   height: weight))
        //
        //
        //        if let notNullImageView = imgView {
        //            notNullImageView.contentMode = .scaleAspectFit
        //            notNullImageView.image = image
        //
        //            addSubview(notNullImageView)
        //            sendSubview(toBack: notNullImageView)
        //
        //        }


        btnQuestion = UIButton(type: .custom)
        if let notNullQuestionBtn = btnQuestion{
            notNullQuestionBtn.addTarget(self,
                                         action: #selector(self.openEmoji),
                                         for: .touchUpInside)
            notNullQuestionBtn.frame = CGRect(x: imgLeftInset,
                                              y: imgTopInset,
                                              width: weight,
                                              height: weight)
            notNullQuestionBtn.setBackgroundImage(image, for: .normal)
        }


        leftView = btnQuestion

        //leftView = imgView

        hideOrShowImageQuestion()
    }

    func hideOrShowImageQuestion() {
        if imageQuestionShowed {
            //hide it
            hideQuestionImage()
        } else {
            //show it
            showQuestionImage()
        }

        //        imageQuestionShowed = !imageQuestionShowed
    }

    func openEmoji() {

    }

    func showQuestionImage() {
        //        self.image = UIImage(named: "question")
        //
        //        let weight = self.bounds.height - (self.imgTopInset + self.imgBottomInset)
        //        self.imgView = UIImageView(frame:
        //            CGRect(x: self.imgLeftInset,
        //                   y: self.imgTopInset,
        //                   width: weight,
        //                   height: weight))
        //
        //        self.imgView?.contentMode = .scaleAspectFit
        //        self.imgView?.image = self.image

        //        self.clipsToBounds = true

        leftViewMode = .always
        //        leftView = self.imgView

        //        self.rightViewMode = .always
        //        self.rightView = self.imgView

        //        self.rightView?.bounds.origin.x -= 100

        //        if let notNullImageView = imgView {
        //            self.addSubview(notNullImageView)
        //            self.sendSubview(toBack: notNullImageView)
        //        }



        //        self.setNeedsLayout()
        //        self.setNeedsDisplay()

    }

    func hideQuestionImage() {
        self.leftViewMode = .never
    }

    //    override func prepareForInterfaceBuilder() {
    //        super.prepareForInterfaceBuilder()
    //        commonInit()
    //    }


    //    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
    ////        var textRect:CGRect  = super.rightViewRect(forBounds: bounds)
    ////        textRect.origin.x -= 10;
    ////        return textRect;
    //    }

    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect:CGRect  = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += imgLeftInset;
        return textRect;
    }
    
    
    
    
    
    
}


//    func InitWithCoder:(NSCoder*)coder {
//    self = [super initWithCoder:coder];
//
//    if (self) {
//
//    self.clipsToBounds = YES;
//    [self setRightViewMode:UITextFieldViewModeUnlessEditing];
//
//    self.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"textfield_edit_icon.png"]];
//    }
//
//    return self;
//    }

//}
