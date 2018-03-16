//
//  ViewController.m
//  TestDraw
//
//  Created by 小萌 on 2018/1/30.
//  Copyright © 2018年 sunxm. All rights reserved.
//

#import "ViewController.h"
#import "TDView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    TDView *view = [[TDView alloc] initWithFrame:CGRectMake(10, 100, 300, 300)];
    //    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
