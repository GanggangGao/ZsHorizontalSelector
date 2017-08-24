//
//  ViewController+SImage.m
//  ZsHorizontalSelector
//
//  Created by zachary spark on 2017/8/24.
//  Copyright © 2017年 zachary. All rights reserved.
//

#import "ViewController+SImage.h"

@implementation UIViewController (SImage)

CGImageRef sCreateImage(CGPoint offset, BOOL opaque, CGSize size, CGFloat scale, void (^callback)(CGContextRef))
{
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextTranslateCTM(context, offset.x, offset.y);
    
    if (callback) callback(context);
    
    CGImageRef result = context ? CGBitmapContextCreateImage(context) : NULL;
    
    UIGraphicsEndImageContext();
    
    return result;
}


UIImage *sMakeImage(CGSize size, BOOL opaque, CGFloat scale, void (^callback)(CGContextRef))
{
    if (size.width < 1 || size.height < 1) return nil;
    
    CGImageRef image  = sCreateImage(CGPointZero, opaque, size, scale, callback);
    UIImage   *result = nil;
    
    if (scale < 1.0) {
        scale = [[UIScreen mainScreen] scale];
    }
    
    if (image) {
        result = [UIImage imageWithCGImage:image scale:scale orientation:UIImageOrientationUp];
        CFRelease(image);
    }
    
    return result;
}

@end
