//
//  RadioButton.m
//  RadioButton
//
//  Created by qq on 2018/2/27.
//  Copyright © 2018年 yhy. All rights reserved.
//

#import "RadioButton.h"
#import "UIColor+Hex.h"

@interface RadioButton()
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIImageView *ivIcon;
@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@end

@implementation RadioButton
// MARK: - Initializer
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame: frame];
    [self awakeFromNib];
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.contentView = [[[NSBundle mainBundle]loadNibNamed:@"RadioButton" owner:self options:nil]lastObject];
    
    // use bounds not frame or it'll be offset
    self.contentView.frame = self.bounds;
    
    // Make the view stretch with containing view
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    // 这些初始化属性必须要，否则你在故事板中设置的属性在运行时无效！！
    [self setImage:_image?_image:[UIImage imageNamed:@"radio_nor"]];
    
    [self setSelectedImage:_selectedImage?_selectedImage:[UIImage imageNamed:@"radio_sel"]];
    
    if(_attributeTitle){
        [self setAttributeTitle:_attributeTitle];
    }else if(_title) {
        [self setTitle:_title];
        [self setFontSize:_fontSize?_fontSize:12];
        [self setTextColor:_textColor?_textColor:[UIColor colorWithHex:0x666666]];
    }
    
    [self addSubview:self.contentView];
    
    self.backgroundColor = [UIColor clearColor];// 使故事板中对背景色的设置无效
}
// MARK: - Setter
-(void)setImage:(UIImage *)image{
    _image = _ivIcon.image = image;
}
-(void)setTitle:(NSString *)title{
    _title = _lbTitle.text = title;
}
-(void)setAttributeTitle:(NSAttributedString *)attributeTitle{
    _attributeTitle = _lbTitle.attributedText = attributeTitle;
}
-(void)setFontSize:(CGFloat)fontSize{
    _fontSize = fontSize;
    self.lbTitle.font = [UIFont systemFontOfSize:fontSize];
}
-(void)setTextColor:(UIColor *)textColor{
    _textColor = _lbTitle.textColor = textColor;
}
-(void)setSelected:(BOOL)selected{
    super.selected = selected;
    if(selected){
        if(_selectedImage){
            self.ivIcon.image = _selectedImage;
        }
    }else{
        self.ivIcon.image = _image;
    }
}
-(void)setEnabled:(BOOL)enabled{
    super.enabled = enabled;
    if(enabled){
        self.ivIcon.image = _image;
    }else{
        if(_disabledImage){
            self.ivIcon.image = _disabledImage;
        }
    }
}
// 响应触摸事件
//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    _image = self.ivIcon.image;
//    UIImage * img = [_image colorImage:[UIColor colorWithHex:0xaaaaaa]];
//    [self.ivIcon setImage:img];
//    oldTitleColor = self.lbTitle.textColor;
//    self.lbTitle.textColor = [UIColor colorWithHex:0xdddddd];
//}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self];
    // 将触摸点坐标转换为 ivIcon 上的坐标
    point = [_ivIcon.layer convertPoint:point fromLayer:self.layer];
    
    if ([_ivIcon.layer containsPoint:point]) {
        [_delegate radioButtonIconTouched:self];
    }else{
        point = [_lbTitle.layer convertPoint:point fromLayer:_ivIcon.layer];
        if([_lbTitle.layer containsPoint:point]){
            [_delegate radioButtonTitleTouched:self atPoint:point];
        }
    }
}
@end
