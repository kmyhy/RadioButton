//
//  ViewController.m
//  RadioButton
//
//  Created by qq on 2018/2/27.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "ViewController.h"
#import "RadioButton.h"

@interface ViewController ()<RadioButtonDelegate>
@property (weak, nonatomic) IBOutlet RadioButton *radioButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _radioButton.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// MARK: - RadioButtonDelegate
-(void)radioButtonIconTouched:(RadioButton *)radioButton{
    radioButton.selected = !radioButton.selected;
}
-(void)radioButtonTitleTouched:(RadioButton *)radioButton atPoint:(CGPoint)point{
    if(point.x>56 && point.x<165){// 这个范围是超链所在位置，需要响应事件
        NSLog(@"point:x=%f,y=%f",point.x,point.y);
    }
}
@end
