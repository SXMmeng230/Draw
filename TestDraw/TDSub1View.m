//
//  TDSub1View.m
//  TestDraw
//
//  Created by 小萌 on 2018/1/31.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "TDSub1View.h"
@interface TDSub1View()
@end

@implementation TDSub1View
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (NSMutableArray *)arr
{
    if (!_arr) {
        _arr = [NSMutableArray array];
        
    }
    return _arr;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    if (self.arr.count == 0) {
        return;
    }
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();

    NSDictionary *dic1 = self.arr[0];
    CGPoint point1 = CGPointMake([dic1.allKeys.firstObject floatValue], [dic1.allValues.firstObject floatValue]);
    CGPathMoveToPoint(path, NULL, point1.x, point1.y);

    NSDictionary *dic2 = self.arr[1];;
    CGPoint point2 = CGPointMake([dic2.allKeys.firstObject floatValue], [dic2.allValues.firstObject floatValue]);
    CGPathAddLineToPoint(path, NULL, point2.x, point2.y);


    NSDictionary *dic3 = self.arr[2];;
    CGPoint point3 = CGPointMake([dic3.allKeys.firstObject floatValue], [dic3.allValues.firstObject floatValue]);
    CGPathAddLineToPoint(path, NULL, point3.x, point3.y);

    //
        NSDictionary *dic4 = self.arr[3];;
    CGPoint point4 = CGPointMake([dic4.allKeys.firstObject floatValue], [dic4.allValues.firstObject floatValue]);
    CGPathAddLineToPoint(path, NULL, point4.x, point4.y);


    NSDictionary *dic5 = self.arr[4];
    CGPoint point5 = CGPointMake([dic5.allKeys.firstObject floatValue], [dic5.allValues.firstObject floatValue]);

    CGPathAddLineToPoint(path, NULL, point5.x, point5.y);
    CGPathCloseSubpath(path);
    [self drawLinearGradient:ctx path:path startColor:[UIColor colorWithRed:0/255.0 green:142/255.0 blue:170/255.0 alpha:0.9].CGColor endColor:[UIColor colorWithRed:0/255.0 green:142/255.0 blue:170/255.0 alpha:0.7].CGColor];

//


}
- (void)drawLinearGradient:(CGContextRef)context
                      path:(CGPathRef)path
                startColor:(CGColorRef)startColor
                  endColor:(CGColorRef)endColor
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 0.8,1.0 };
    
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    
    
    CGRect pathRect = CGPathGetBoundingBox(path);
    
    //具体方向可根据需求修改 可改变方向是的渐变颜色45°或者垂直方向渐变颜色
    CGPoint startPoint = CGPointMake(CGRectGetMidX(pathRect), CGRectGetMinY(pathRect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(pathRect), CGRectGetMaxY(pathRect));
    
    CGContextSaveGState(context);
    CGContextAddPath(context, path);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end
