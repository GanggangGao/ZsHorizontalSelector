//
//  ViewController.m
//  ZsHorizontalSelector
//
//  Created by zachary spark on 2017/8/24.
//  Copyright © 2017年 zachary. All rights reserved.
//

#import "ViewController.h"
#import "ViewController+SImage.h"
#import "HorizontalPickerView.h"
#import <Masonry.h>
@interface ViewController ()<HorizontalPickerViewDelegate>

@property(nonatomic,strong)NSArray *array;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.array = [[NSArray alloc]initWithObjects:@"6:00",@"7:00",@"8:00",@"10:00",@"11:00", nil];
    
    
    HorizontalPickerView *PickerView = [[HorizontalPickerView alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    PickerView.delegate = self;
    [self.view addSubview:PickerView];
    
    [PickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
    
}


- (NSInteger) numberOfChoicesInPickerView:(HorizontalPickerView *)pickerView{

    return self.array.count;

}

- (UIImage *) pickerView:(HorizontalPickerView *)pickerView imageForChoiceAtIndex:(NSInteger)index{

    __weak typeof(self)WeakSelf = self;
    return sMakeImage(CGSizeMake(45, 45), NO, 0, ^(CGContextRef context) {
        UIColor* color = [UIColor colorWithRed:64/255.0 green:64/255.0 blue:107/255.0 alpha:1];
        
        NSMutableParagraphStyle*ParagraphStyle = [[NSMutableParagraphStyle alloc]init];
        
        ParagraphStyle.alignment = NSTextAlignmentCenter;
        
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15], NSFontAttributeName,color,NSForegroundColorAttributeName,ParagraphStyle,NSParagraphStyleAttributeName,nil];
        
        NSString* indexAsString = [WeakSelf.array objectAtIndex:index];
        
        [indexAsString drawInRect:CGRectMake(0, 45/2 - 15/2, 45, 45) withAttributes:dict];
        
    });

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
