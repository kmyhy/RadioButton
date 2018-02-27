//
//  RadioButton.h
//  RadioButton
//
//  Created by qq on 2018/2/27.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RadioButton;
@protocol RadioButtonDelegate<NSObject>

-(void)radioButtonIconTouched:(RadioButton*)radioButton;
-(void)radioButtonTitleTouched:(RadioButton*)radioButton atPoint:(CGPoint)point;
@end

@interface RadioButton : UIControl

@property(weak,nonatomic)id<RadioButtonDelegate> delegate;
// IB 属性
@property (strong,nonatomic)IBInspectable UIImage* image;
@property (strong,nonatomic)IBInspectable UIImage* disabledImage;
@property (strong,nonatomic)IBInspectable UIImage* selectedImage;

@property (strong,nonatomic)IBInspectable NSString* title;
//@property (strong,nonatomic)IBInspectable NSString* disabledTitle;
//@property (strong,nonatomic)IBInspectable NSString* selectedTitle;

@property (strong,nonatomic)IBInspectable NSAttributedString* attributeTitle;
//@property (strong,nonatomic)IBInspectable NSAttributedString* disabledAttributeTitle;
//@property (strong,nonatomic)IBInspectable NSAttributedString* selectedAttributeTitle;

@property (assign,nonatomic)IBInspectable CGFloat fontSize;
@property (strong,nonatomic)IBInspectable UIColor* textColor;

@end
