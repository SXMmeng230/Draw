//
//  TDView.m
//  TestDraw
//
//  Created by 小萌 on 2018/1/31.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "TDView.h"
#import "TDSubView.h"
#import "TDSub1View.h"
@implementation TDView
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addView];
        
    }
    return self;
}
- (void)addView
{
    TDSubView *view = [[TDSubView alloc] initWithFrame:CGRectMake(0, 0, 250, 250)];
    //    view.backgroundColor = [UIColor redColor];
    view.color = [UIColor redColor];
    view.center = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    view.tag = 500;
    [self addSubview:view];
    
    TDSubView *view1 = [[TDSubView alloc] init];
    //    view1.backgroundColor = [UIColor clearColor];
    view1.color = [UIColor yellowColor];
    view1.frame = CGRectMake(0, 0, 200, 200);
    view1.center = view.center;
    view1.tag = 501;

    [self addSubview:view1];

    
    TDSubView *view2 = [[TDSubView alloc] init];
    //    view1.backgroundColor = [UIColor clearColor];
    view2.color = [UIColor whiteColor];
    view2.frame = CGRectMake(0, 0, 150, 150);
    view2.center = view.center;
    view2.tag = 502;

    [self addSubview:view2];


    
    TDSubView *view3 = [[TDSubView alloc] init];
    //    view1.backgroundColor = [UIColor clearColor];
    view3.color = [UIColor yellowColor];
    view3.frame = CGRectMake(0, 0, 100, 100);
    view3.center = view.center;
    view3.tag = 503;

    [self addSubview:view3];

    
    TDSubView *view4 = [[TDSubView alloc] init];
    //    view1.backgroundColor = [UIColor clearColor];
    view4.color = [UIColor whiteColor];
    view4.frame = CGRectMake(0, 0, 50, 50);
    view4.center = view.center;
    view4.tag = 504;
    [self addSubview:view4];
    
    
    TDSub1View *view5 = [[TDSub1View alloc] init];
    view5.frame = view.bounds;
    view5.center = view.center;
    view5.tag = 505;
    [self addSubview:view5];


}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    TDSubView *view1 = [self viewWithTag:500];
    TDSubView *view2 = [self viewWithTag:501];
    TDSubView *view3 = [self viewWithTag:502];
    TDSubView *view4 = [self viewWithTag:503];
    TDSubView *view5 = [self viewWithTag:504];
    TDSub1View *view6 = [self viewWithTag:505];
    if (view5.pointArr.count == 0) {
        return;
    }
    NSDictionary *dic5 = view5.pointArr[4];
    CGPoint point5 = [view5 convertPoint:CGPointMake([dic5.allKeys.firstObject floatValue], [dic5.allValues.firstObject floatValue]) toView:view1];
    [view6.arr addObject:@{@(point5.x):@(point5.y)}];
    
    NSDictionary *dic4 = view4.pointArr[3];
    CGPoint point4 = [view4 convertPoint:CGPointMake([dic4.allKeys.firstObject floatValue], [dic4.allValues.firstObject floatValue]) toView:view1];
    [view6.arr addObject:@{@(point4.x):@(point4.y)}];

    NSDictionary *dic1 = view1.pointArr[2];
    CGPoint point1 = [view1 convertPoint:CGPointMake([dic1.allKeys.firstObject floatValue], [dic1.allValues.firstObject floatValue]) toView:view1];
    [view6.arr addObject:@{@(point1.x):@(point1.y)}];

    NSDictionary *dic2 = view2.pointArr[1];
    CGPoint point2 = [view2 convertPoint:CGPointMake([dic2.allKeys.firstObject floatValue], [dic2.allValues.firstObject floatValue]) toView:view1];
    [view6.arr addObject:@{@(point2.x):@(point2.y)}];

    NSDictionary *dic3 = view3.pointArr[0];
    CGPoint point3 = [view3 convertPoint:CGPointMake([dic3.allKeys.firstObject floatValue], [dic3.allValues.firstObject floatValue]) toView:view1];
    [view6.arr addObject:@{@(point3.x):@(point3.y)}];

    

    
    
    [view6 setNeedsDisplay];

}



@end
