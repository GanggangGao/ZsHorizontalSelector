//
//  ViewController+SImage.h
//  ZsHorizontalSelector
//
//  Created by zachary spark on 2017/8/24.
//  Copyright © 2017年 zachary. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIViewController (SImage)

CGImageRef sCreateImage(CGPoint offset, BOOL opaque, CGSize size, CGFloat scale, void (^callback)(CGContextRef));

//String 画图
UIImage *sMakeImage(CGSize size, BOOL opaque, CGFloat scale, void (^callback)(CGContextRef));
@end
