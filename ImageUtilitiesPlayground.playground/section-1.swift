//  Copyright (c) 2014 TakanoriMatsumoto All rights reserved.

import Foundation
import Accelerate
import UIKit
import QuartzCore
import SpriteKit



func triangleBottomImage() -> UIImage {
    var width: CGFloat = 200
    var height: CGFloat = 200
    
    UIGraphicsBeginImageContextWithOptions(CGSize(width:  width, height: height), false, 1)
    
    let context = UIGraphicsGetCurrentContext()
    
    CGContextSetAllowsAntialiasing(context, false)
    CGContextSetLineWidth(context, 20.0)
    
    CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 1)
    CGContextMoveToPoint(context, 0, height)
    CGContextAddLineToPoint(context, width, 0)
    CGContextAddLineToPoint(context, width, height)
    CGContextStrokePath(context)
    
    return UIGraphicsGetImageFromCurrentImageContext()
}

func reversedImage(image: UIImage) -> UIImage {
    let width: CGFloat = image.size.width
    let height: CGFloat = image.size.height
    
    UIGraphicsBeginImageContextWithOptions(CGSize(width:  width, height: height), false, 1)
    
    let context = UIGraphicsGetCurrentContext()
    CGContextTranslateCTM(context, 0, 0)
    CGContextScaleCTM(context, 1.0, 1.0)
    
    var imageRef: CGImageRef = image.CGImage
    var frame: CGRect = CGRectMake(0, 0, width, height)
    CGContextDrawImage(context, frame, imageRef)
    
    return UIGraphicsGetImageFromCurrentImageContext()
}


let image: UIImage = triangleBottomImage()
let rImage: UIImage = reversedImage(image)





let width: CGFloat = image.size.width
let height: CGFloat = image.size.height

UIGraphicsBeginImageContextWithOptions(CGSize(width:  width, height: height / 2), false, 1)

let context = UIGraphicsGetCurrentContext()
rImage.drawAtPoint(CGPointMake(0, 0))

let pImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()



