//
//  BasePageControl.swift
//  BaseSdk
//
//  Created by Howard on 2021/1/26.
//

import Foundation

//pageControl控件
open class BasePageControl: UIControl {
    open var normalImage:UIImage?
    open var selectedImage:UIImage?
    open var space:CGFloat = 0
    open var numberOfPages:Int = 0
    open var currentPage:Int = 0
    open var itemWidth:CGFloat = 10.0
    
    
    open func setup(_ normalImage:UIImage,_ selectedImage:UIImage,_ space:CGFloat,_ itemWidth:CGFloat) {
        self.normalImage = normalImage
        self.selectedImage = selectedImage
        self.backgroundColor = UIColor.clear
        self.space = space
        self.itemWidth = itemWidth
    }
    
    open func setCurrentPage(_ page:Int) {
        self.currentPage = page
        self.setNeedsDisplay()
    }
    
    open func setNumberOfPages(_ number:Int) {
        self.numberOfPages = number
        self.setNeedsDisplay()
    }
    
    
    open override func draw(_ rect: CGRect) {
        if self.numberOfPages <= 1 {
            return
        }
        let total_width = CGFloat(self.numberOfPages) * itemWidth + CGFloat((self.numberOfPages - 1)) * space
        for i in 0..<self.numberOfPages {
            let left = (self.frame.size.width - total_width) / 2 + CGFloat(i) * (space + itemWidth)
            if i == self.currentPage {
                selectedImage!.draw(in: CGRect(x: left , y: (self.frame.size.height - itemWidth)/2.0, width: itemWidth, height:itemWidth ))
            } else {
                normalImage!.draw(in: CGRect(x: left , y: (self.frame.size.height - itemWidth)/2.0, width: itemWidth, height:itemWidth ))
            }
        }
    }
    
}
