//
//  HorizontalPickerView.h
//  AirPur
//
//  Created by zachary spark on 2017/8/21.
//  Copyright © 2017年 zachary. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HorizontalPickerViewDelegate;


@interface HorizontalPickerView : UIControl

@property(nonatomic, weak) id<HorizontalPickerViewDelegate> delegate;

- (void) setSelectedIndex:(NSInteger)index animated:(BOOL)animated;
@property (nonatomic) NSInteger selectedIndex;

@end

@protocol HorizontalPickerViewDelegate <NSObject>
- (NSInteger) numberOfChoicesInPickerView:(HorizontalPickerView *)pickerView;
- (UIImage *) pickerView:(HorizontalPickerView *)pickerView imageForChoiceAtIndex:(NSInteger)index;
@end

