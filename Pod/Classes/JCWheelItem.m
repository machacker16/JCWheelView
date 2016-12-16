//
//  JCWheelItem.m
//  JCWheelView
//
//  Created by 李京城 on 15/6/27.
//  Copyright (c) 2014 李京城. All rights reserved.
//

#import "JCWheelItem.h"
#import "JCWheelView.h"

@interface JCWheelItem ()

@property (nonatomic, assign) CGFloat startRadians;
@property (nonatomic, assign) CGFloat endRadians;
@property (nonatomic, assign) CGFloat radius;

@end

@implementation JCWheelItem

- (instancetype)initWithWheelView:(JCWheelView *)wheelView {
    _radius = wheelView.frame.size.width/2;
    _startRadians = DEGREES_TO_RADIANS(270 - ((360/wheelView.numberOfItems)/2));
    _endRadians = DEGREES_TO_RADIANS(270 + ((360/wheelView.numberOfItems)/2));
    
    CGRect frame = wheelView.bounds;
    
    if (wheelView.numberOfItems > 1) {
        UIBezierPath *arcPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(_radius, _radius) radius:_radius startAngle:_startRadians endAngle:_endRadians clockwise:YES];
        
        frame = CGRectMake(0, 0, arcPath.bounds.size.width, _radius);
    }
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.layer.anchorPoint = CGPointMake(0.5, (_radius/2)/frame.size.height);
    }
    
    return self;
}

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGPoint center = CGPointMake(CGRectGetMidX(rect), self.radius);
    
    self.bezierPath = [UIBezierPath bezierPathWithArcCenter:center radius:self.radius startAngle:self.startRadians endAngle:self.endRadians clockwise:YES];
    [self.bezierPath addArcWithCenter:center radius:0 startAngle:self.startRadians endAngle:self.endRadians clockwise:YES];
    [self.bezierPath closePath];
}

@end
