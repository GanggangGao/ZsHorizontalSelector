# ZsHorizontalSelector

横向滚动的选择器，可以自己自定义。


使用：
useing

    HorizontalPickerView *PickerView = [[HorizontalPickerView alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    PickerView.delegate = self;
    [self.view addSubview:PickerView];
    
    [PickerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
    
1.需要实现代理
HorizontalPickerViewDelegate
- (NSInteger) numberOfChoicesInPickerView:(HorizontalPickerView *)pickerView
- (UIImage *) pickerView:(HorizontalPickerView *)pickerView imageForChoiceAtIndex:(NSInteger)index
需要返回给界面一个UIimage的一个对象，

如果是文字的话需要自己用nsstring画出一张图片贴上去。
ViewController+SImage.h ViewController+SImage.m
是画图的一个方法可以参考

支持xib

