//
//  AutoLayout.swift
//  AutoLayout
//
//  Created by lehoanglong on 8/11/16.
//  Copyright © 2016 LeHoangLong. All rights reserved.
//

import Foundation
import UIKit

enum ConstraintType {
    
    case innerLeft
    case innerTop
    case innerRight
    case innerBottom
    case innerTopLeft
    case innerTopRight
    case innerBottomLeft
    case innerBottomRight
    case center
    case topOfAnotherView
    case bottomOfAnotherView
    case rightOfAnotherView
    case leftOfAnotherView
    case sameTopAlignButRightOfAnotherView
    case sameTopAlignButLeftOfAnotherView
    case sameBottomAlignButRightOfAnotherView
    case sameBottomAlignButLeftOfAnotherView
    case sameRightAlignButTopOfAnotherView
    case sameRightAlignButBottomOfAnotherView
    case sameLeftAlignButTopOfAnotherView
    case sameLeftAlignButBottomOfAnoterView
    
    func attribute(haveMargin haveMargin:Bool)->(xConstraintSelf:NSLayoutAttribute,xConstraintView:NSLayoutAttribute,yConStraintSelf:NSLayoutAttribute,yConstraintView:NSLayoutAttribute, id: String){
        switch haveMargin {
        case false:
            switch self {
            case .topOfAnotherView:
                return (.CenterX,.CenterX,.Bottom,.Top,"topOfAnotherView")
            case .bottomOfAnotherView:
                return (.CenterX,.CenterX,.Top,.Bottom,"bottomOfAnotherView")
            case .rightOfAnotherView:
                return (.Left,.Right,.CenterY,.CenterY,"rightOfAnotherView")
            case .leftOfAnotherView:
                return (.Right,.Left,.CenterY,.CenterY,"leftOfAnotherView")
            case .sameTopAlignButRightOfAnotherView:
                return (.Left,.Right,.Top,.Top,"sameTopAlignButRightOfAnotherView")
            case .sameTopAlignButLeftOfAnotherView:
                return (.Right,.Left,.Top,.Top,"sameTopAlignButLeftOfAnotherView")
            case .sameBottomAlignButRightOfAnotherView:
                return (.Left,.Right,.Bottom,.Bottom,"sameBottomAlignButRightOfAnotherView")
            case .sameBottomAlignButLeftOfAnotherView:
                return (.Right,.Left,.Bottom,.Bottom,"sameBottomAlignButLeftOfAnotherView")
            case .sameRightAlignButTopOfAnotherView:
                return (.Right,.Right,.Bottom,.Top,"sameRightAlignButTopOfAnotherView")
            case .sameRightAlignButBottomOfAnotherView:
                return (.Right,.Right,.Top,.Bottom,"sameRightAlignButBottomOfAnotherView")
            case .sameLeftAlignButTopOfAnotherView:
                return (.Left,.Left,.Bottom,.Top,"sameLeftAlignButTopOfAnotherView")
            case .sameLeftAlignButBottomOfAnoterView:
                return (.Left,.Left,.Top,.Bottom,"sameLeftAlignButBottomOfAnotherView")
            case .center:
                return (.CenterX,.CenterX,.CenterY,.CenterY,"center")
            case .innerTopRight:
                return (.Right,.Right,.Top,.Top,"innerTopRight")
            case .innerTopLeft:
                return (.Left,.Left,.Top,.Top,"innerTopLeft")
            case .innerBottomRight:
                return (.Right,.Right,.Bottom,.Bottom,"innerBottomRight")
            case .innerBottomLeft:
                return (.Left,.Left,.Bottom,.Bottom,"innerTopLeft")
            case .innerTop:
                return (.CenterX,.CenterX,.Top,.Top,"innerTop")
            case .innerBottom:
                return (.CenterX,.CenterX,.Bottom,.Bottom,"innerBottom")
            case .innerLeft:
                return (.Left,.Left,.CenterY,.CenterY,"innerLeft")
            case .innerRight:
                return (.Right,.Right,.CenterY,.CenterY,"innerRight")
            }
        default:
            switch self {
            case .topOfAnotherView:
                return (.CenterX,.CenterX,.BottomMargin,.TopMargin,"topOfAnotherView")
                
            case .bottomOfAnotherView:
                return (.CenterX,.CenterX,.TopMargin,.BottomMargin,"bottomOfAnotherView")
                
            case .rightOfAnotherView:
                return (.LeftMargin,.RightMargin,.CenterY,.CenterY,"rightOfAnotherView")
                
            case .leftOfAnotherView:
                return (.RightMargin,.LeftMargin,.CenterY,.CenterY,"leftOfAnotherView")
            case .sameTopAlignButRightOfAnotherView:
                return (.LeftMargin,.RightMargin,.TopMargin,.TopMargin,"sameTopAlignButRightOfAnotherView")
            case .sameTopAlignButLeftOfAnotherView:
                return (.RightMargin,.LeftMargin,.TopMargin,.TopMargin,"sameTopAlignButLeftOfAnotherView")
            case .sameBottomAlignButRightOfAnotherView:
                return (.LeftMargin,.RightMargin,.BottomMargin,.BottomMargin,"sameBottomAlignButRightOfAnotherView")
            case .sameBottomAlignButLeftOfAnotherView:
                return (.RightMargin,.LeftMargin,.BottomMargin,.BottomMargin,"sameBottomAlignButLeftOfAnotherView")
            case .sameRightAlignButTopOfAnotherView:
                return (.RightMargin,.RightMargin,.BottomMargin,.TopMargin,"sameRightAlignButTopOfAnotherView")
            case .sameRightAlignButBottomOfAnotherView:
                return (.RightMargin,.RightMargin,.TopMargin,.BottomMargin,"sameRightAlignButBottomOfAnotherView")
            case .sameLeftAlignButTopOfAnotherView:
                return (.LeftMargin,.LeftMargin,.BottomMargin,.TopMargin,"sameLeftAlignButTopOfAnotherView")
            case .sameLeftAlignButBottomOfAnoterView:
                return (.LeftMargin,.LeftMargin,.TopMargin,.BottomMargin,"sameLeftAlignButBottomOfAnotherView")
            case .center:
                return (.CenterX,.CenterX,.CenterY,.CenterY,"center")
            case .innerTopRight:
                return (.Right,.RightMargin,.Top,.TopMargin,"innerTopRight")
            case .innerTopLeft:
                return (.Left,.LeftMargin,.Top,.TopMargin,"innerTopLeft")
            case .innerBottomRight:
                return (.Right,.RightMargin,.Bottom,.BottomMargin,"innerBottomRight")
            case .innerBottomLeft:
                return (.Left,.LeftMargin,.Bottom,.BottomMargin,"innerBottomLeft")
            case .innerTop:
                return (.CenterX,.CenterX,.Top,.TopMargin,"innerTop")
            case .innerBottom:
                return (.CenterX,.CenterX,.Bottom,.BottomMargin,"innerBottom")
            case .innerLeft:
                return (.Left,.LeftMargin,.CenterY,.CenterY,"innerLeft")
            case .innerRight:
                return (.Right,.RightMargin,.CenterY,.CenterY,"innerRight")            }
            
        }
    }
    
}
extension UIView {
    
    func autoLayoutForTwoSidesAndSize(withView toview:UIView, constraintType:ConstraintType, size: CGSize ,offset: UIOffset = UIOffsetZero, haveMargin:Bool){
        let constraintAttribute = constraintType.attribute(haveMargin: haveMargin)
        autoLayoutStruct(size: size,
                         xConstraintSelf: constraintAttribute.xConstraintSelf,
                         xConstraintView: constraintAttribute.xConstraintView,
                         yConstraintSelf: constraintAttribute.yConStraintSelf,
                         yConstraintView: constraintAttribute.yConstraintView,
                         offset: offset,
                         view:toview)
    }
    
    func autoLayoutForEdge(edgeInset edgeInset:UIEdgeInsets, topView: UIView, leftView: UIView, rightView: UIView,bottomView: UIView) {
        var topConstraint = NSLayoutConstraint()
        var leftConstraint = NSLayoutConstraint()
        var rightConstraint = NSLayoutConstraint()
        var bottomConstraint = NSLayoutConstraint()
        if (topView == self.superview) {
            topConstraint = NSLayoutConstraint(item: self,
                                               attribute: .Top,
                                               relatedBy: .Equal,
                                               toItem: topView,
                                               attribute: .Top,
                                               multiplier: 1,
                                               constant: edgeInset.top)
        } else {
            topConstraint = NSLayoutConstraint(item: self,
                                               attribute: .Top,
                                               relatedBy: .Equal,
                                               toItem: topView,
                                               attribute: .Bottom,
                                               multiplier: 1,
                                               constant: edgeInset.top)
        }
        if (leftView == self.superview){
            leftConstraint = NSLayoutConstraint(item: self,
                                                attribute: .Left,
                                                relatedBy: .Equal,
                                                toItem: leftView,
                                                attribute: .Left,
                                                multiplier: 1,
                                                constant: edgeInset.top)
        } else {
            leftConstraint = NSLayoutConstraint(item: self,
                                                attribute: .Left,
                                                relatedBy: .Equal,
                                                toItem: leftView,
                                                attribute: .Right,
                                                multiplier: 1,
                                                constant: edgeInset.top)
            
        }
        if (rightView == self.superview){
            rightConstraint = NSLayoutConstraint(item: self,
                                                 attribute: .Right,
                                                 relatedBy: .Equal,
                                                 toItem: rightView,
                                                 attribute: .Right,
                                                 multiplier: 1,
                                                 constant: edgeInset.right)
        } else{
            rightConstraint = NSLayoutConstraint(item: self,
                                                 attribute: .Right,
                                                 relatedBy: .Equal,
                                                 toItem: rightView,
                                                 attribute: .Left,
                                                 multiplier: 1,
                                                 constant: edgeInset.right)
            
        }
        if (bottomView == self.superview){
            bottomConstraint = NSLayoutConstraint(item: self,
                                                  attribute: .Bottom,
                                                  relatedBy: .Equal,
                                                  toItem: bottomView,
                                                  attribute: .Bottom,
                                                  multiplier: 1,
                                                  constant: edgeInset.bottom)
        } else{
            bottomConstraint = NSLayoutConstraint(item: self,
                                                  attribute: .Bottom,
                                                  relatedBy: .Equal,
                                                  toItem: bottomView,
                                                  attribute: .Top,
                                                  multiplier: 1,
                                                  constant: edgeInset.bottom)
            
        }
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activateConstraints([topConstraint,leftConstraint,rightConstraint,bottomConstraint])
        
    }
    
    func autoLayoutStruct(size size: CGSize, xConstraintSelf: NSLayoutAttribute, xConstraintView: NSLayoutAttribute, yConstraintSelf: NSLayoutAttribute, yConstraintView: NSLayoutAttribute, offset: UIOffset,view:UIView) {
        //set width
        let widthConstraint = NSLayoutConstraint(item: self,
                                                 attribute: .Width,
                                                 relatedBy: .Equal,
                                                 toItem: nil,
                                                 attribute: .NotAnAttribute,
                                                 multiplier: 1,
                                                 constant: size.width)
        //set height
        let heightConstraint = NSLayoutConstraint(item: self,
                                                  attribute: .Height,
                                                  relatedBy: .Equal,
                                                  toItem: nil,
                                                  attribute: .NotAnAttribute,
                                                  multiplier: 1,
                                                  constant: size.height)
        let xConstraint = NSLayoutConstraint(item: self,
                                             attribute: xConstraintSelf,
                                             relatedBy: .Equal,
                                             toItem: view,
                                             attribute: xConstraintView,
                                             multiplier: 1,
                                             constant: offset.horizontal)
        
        let yConstraint = NSLayoutConstraint(item: self, attribute: yConstraintSelf, relatedBy: .Equal, toItem: view, attribute: yConstraintView, multiplier: 1, constant: offset.vertical)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activateConstraints([widthConstraint,heightConstraint,xConstraint,yConstraint])
        
    }
    
//    func buttonCreated(buttonArray buttonArray:[UIButton], edgeInsets:UIEdgeInsets, createdCheckBox:Bool, buttonCheckBox:Int) {
//                print(buttonCheckBox)
//                let viewArray: [UIView] = {
//                    var viewArrayCreated = [UIView]()
//                    for _ in 1...(buttonArray.count-1) {
//                        let view = UIView()
//                        viewArrayCreated += [view]
//                    }
//                    return viewArrayCreated
//                }()
//                let buttonWidth = (self.frame.width - CGFloat(buttonArray.count - 1) - edgeInsets.left-edgeInsets.right) / CGFloat(buttonArray.count)
//                for button in buttonArray {
//                    self.addSubview(button)
//                    button.setImage(UIImage(named: "checked_checkbox"), forState: .Selected)
//                    button.setImage(UIImage(named: "unchecked_checkbox"), forState: .Normal)
//                    button.autoLayoutForTwoSidesAndSize(withView: button.superview!, constraintType: .innerTopLeft, size: CGSize(width:buttonWidth,height:self.frame.height-edgeInsets.bottom-edgeInsets.top), offset: UIOffsetMake(CGFloat(i)*buttonWidth+CGFloat(i)+edgeInsets.left, edgeInsets.top), haveMargin: false)
//                }
//        //
//        //        for i in 0..<buttonArray.count{
//        //            self.addSubview(buttonArray[i])
//        //            if createdCheckBox {
//        //                if i == buttonCheckBox {
//        //            buttonArray[i].
//        //                } else{
//        //            buttonArray[i].setImage(UIImage(named: ""), forState: .Normal)
//        //                }
//        //        }
//        
//                }
//                for i in 0..<viewArray.count{
//                    self.addSubview(viewArray[i])
//                    viewArray[i].backgroundColor = UIColor.darkGrayColor()
//                    viewArray[i].autoLayoutForTwoSidesAndSize(withView: viewArray[i].superview!, constraintType: .innerTopLeft, size: CGSize(width:1,height:self.frame.height-edgeInsets.bottom-edgeInsets.top), offset: UIOffsetMake(CGFloat(i+1)*buttonWidth+CGFloat(i)+edgeInsets.left, edgeInsets.top), haveMargin: false)
//                }
//        
//            func buttonCreated(buttonArray buttonArray:[UIButton], edgeInsets:UIEdgeInsets, createdCheckBox:Bool, buttonCheckBox:Int) {
//                print(buttonCheckBox)
//                let viewArray: [UIView] = {
//                    var viewArrayCreated = [UIView]()
//                    for _ in 1...(buttonArray.count-1) {
//                        let view = UIView()
//                        viewArrayCreated += [view]
//                    }
//                    return viewArrayCreated
//                }()
//                let buttonWidth = (self.frame.width-CGFloat(buttonArray.count-1)-edgeInsets.left-edgeInsets.right)/CGFloat(buttonArray.count)
//        
//                for i in 0..<buttonArray.count{
//                    self.addSubview(buttonArray[i])
//                    if createdCheckBox {
//                        if i == buttonCheckBox {
//                            buttonArray[i].setImage(UIImage(named: "checked_checkbox"), forState: .Normal)
//                        } else{
//                            buttonArray[i].setImage(UIImage(named: "unchecked_checkbox"), forState: .Normal)
//                        }
//                    }
//                    buttonArray[i].autoLayoutForTwoSidesAndSize(withView: buttonArray[i].superview!, constraintType: .innerTopLeft, size: CGSize(width:buttonWidth,height:self.frame.height-edgeInsets.bottom-edgeInsets.top), offset: UIOffsetMake(CGFloat(i)*buttonWidth+CGFloat(i)+edgeInsets.left, edgeInsets.top), haveMargin: false)
//                }
//        
//                for i in 0..<viewArray.count{
//                    self.addSubview(viewArray[i])
//                    viewArray[i].backgroundColor = UIColor.darkGrayColor()
//                    viewArray[i].autoLayoutForTwoSidesAndSize(withView: viewArray[i].superview!, constraintType: .innerTopLeft, size: CGSize(width:1,height:self.frame.height-edgeInsets.bottom-edgeInsets.top), offset: UIOffsetMake(CGFloat(i+1)*buttonWidth+CGFloat(i)+edgeInsets.left, edgeInsets.top), haveMargin: false)
//                }
//                
//            }
//
}