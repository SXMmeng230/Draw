//
//  TDSubView.m
//  TestDraw
//
//  Created by 小萌 on 2018/1/30.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "TDSubView.h"
@implementation TDSubView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
       self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (NSMutableArray *)pointArr
{
    if (!_pointArr) {
        _pointArr = [NSMutableArray array];
    }
    return _pointArr;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self drawFillWithContext:ctx stroke:NO];
    [self drawFillWithContext:ctx stroke:YES];
    [self.superview setNeedsDisplay];
}
- (void)drawFillWithContext:(CGContextRef)ctx stroke:(BOOL)stroke
{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGFloat arc = 360 / 5.0;
    CGFloat rudio = width * 0.5;
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat x1 = width * 0.5;
    CGFloat y1 = height *0.5 - rudio;
    CGContextMoveToPoint(ctx, width * 0.5, height *0.5);
    CGContextAddLineToPoint(ctx, x1,y1);//1
    [self.pointArr addObject:@{@(x1):@(y1)}];
    
    
    CGFloat x2 = width * 0.5 + rudio*cos(M_PI *(90 - arc)/180.0);
    CGFloat y2 = height *0.5 - (rudio*sin(M_PI * (90 - arc)/180.0));
    CGContextAddLineToPoint(ctx, x2,y2);//2
    [self.pointArr addObject:@{@(x2):@(y2)}];
    CGContextAddLineToPoint(ctx, width * 0.5, height *0.5);
    CGContextAddLineToPoint(ctx, x2,y2);
    
    
    //
    CGFloat x3 = width * 0.5 + rudio*cos(M_PI *(2 * arc -90)/180.0);
    CGFloat y3 = height *0.5 + rudio*sin(M_PI * (2 *arc - 90)/180.0);
    CGContextAddLineToPoint(ctx,x3, y3);//3
    [self.pointArr addObject:@{@(x3):@(y3)}];
    CGContextAddLineToPoint(ctx, width * 0.5, height *0.5);
    CGContextAddLineToPoint(ctx, x3, y3);
    //
    
    CGFloat x4 = width * 0.5-rudio*cos(M_PI * (270 - 3 * arc)/180.0);
    CGFloat y4 = height *0.5 + rudio*sin(M_PI * (270- 3*arc)/180.0);
    CGContextAddLineToPoint(ctx,x4, y4);//4
    [self.pointArr addObject:@{@(x4):@(y4)}];
    CGContextAddLineToPoint(ctx, width * 0.5, height *0.5);
    CGContextAddLineToPoint(ctx,x4, y4);
    //
    CGFloat x5 = width * 0.5-rudio*cos(M_PI*(4 * arc - 270)/180.0);
    CGFloat y5 = height *0.5- rudio*sin(M_PI *(4*arc-270)/180.0);
    CGContextAddLineToPoint(ctx,x5,y5);//5
    [self.pointArr addObject:@{@(x5):@(y5)}];
    CGContextAddLineToPoint(ctx, width * 0.5, height *0.5);
    CGContextAddLineToPoint(ctx,x5,y5);
    //
    CGContextAddLineToPoint(ctx, width * 0.5,height *0.5 - rudio);//6
    CGContextClosePath(ctx);

    if (stroke) {
        [[UIColor blackColor] set];
        CGContextStrokePath(ctx);
    }else{
        [self.color set];
        CGContextFillPath(ctx);
    }
}

@end
