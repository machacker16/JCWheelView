//
//  JCViewController.m
//  JCWheelView
//
//  Created by lijingcheng on 06/27/2015.
//  Copyright (c) 2014 lijingcheng. All rights reserved.
//

#import "JCViewController.h"
#import "JCWheelView.h"

#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]

@interface JCViewController ()<JCWheelViewDelegate>

@property (nonatomic, weak) IBOutlet JCWheelView *wheelView;

@property (nonatomic, strong) UIView *colorView;

@property (nonatomic, copy) NSArray *colors;

@end

@implementation JCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.wheelView.delegate = self;
    
    [self.view addSubview:self.colorView];
    
    NSLog(@"\n\n🍀🍀🍀 The warnings in the console can be ignored, the actual use of lib will not exist. 🍀🍀🍀");
}

- (void)viewWillLayoutSubviews {
    self.colorView.center = CGPointMake(self.wheelView.center.x, self.wheelView.center.y + 3);
}

#pragma mark - JCWheelViewDelegate

- (NSInteger)numberOfItemsInWheelView:(JCWheelView *)wheelView {
    return self.colors.count;
}

- (void)wheelView:(JCWheelView *)wheelView didSelectItemAtIndex:(NSInteger)index {
    self.colorView.backgroundColor = self.colors[index];
}

#pragma mark - setter/getter

- (UIView *)colorView {
    if (!_colorView) {
        _colorView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 88, 88)];
        _colorView.layer.cornerRadius = self.colorView.frame.size.width/2;
        _colorView.layer.masksToBounds = YES;
        _colorView.backgroundColor = self.colors.firstObject;
    }
    
    return _colorView;
}

- (NSArray *)colors {
    if (!_colors) {
        _colors = @[RGB(233, 65, 76), RGB(236, 99, 51), RGB(239, 136, 51), RGB(244, 173, 51),
                    RGB(251, 213, 51), RGB(164, 243, 54), RGB(122, 234, 71), RGB(103, 219, 226),
                    RGB(51, 155, 247), RGB(122, 115, 232), RGB(218, 84, 216), RGB(232, 73, 148)];
    }
    
    return _colors;
}

@end
