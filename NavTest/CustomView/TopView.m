//
//  TopView.m
//  NavTest
//
//  Created by 喂！ on 2018/12/11.
//  Copyright © 2018年 well. All rights reserved.
//

#import "TopView.h"

@interface TopView()

@property(nonatomic,strong)UIImageView *backImg;

@property(nonatomic,strong)UIImageView *smallImg;

@end


@implementation TopView

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpSubViews];
    }
    return self;
}

-(void)setUpSubViews
{
    [self addSubview:self.backImg];
    [self addSubview:self.smallImg];
    
}

-(void)layoutSubviews
{
    self.backImg.frame = self.bounds;
    self.smallImg.frame = CGRectMake(self.center.x - 50, self.frame.size.height - 64 - 100, 100, 100);
}

-(UIImageView *)backImg
{
    if (!_backImg) {
        _backImg = [UIImageView new];
        _backImg.image = [UIImage imageNamed:@"1"];
        _backImg.contentMode = UIViewContentModeScaleAspectFill;
        _backImg.clipsToBounds = YES;
        _backImg.layer.masksToBounds = YES;
    }
    return _backImg;
}

-(UIImageView *)smallImg
{
    if (!_smallImg) {
        _smallImg = [UIImageView new];
        _smallImg.image = [UIImage imageNamed:@"111"];
        _smallImg.contentMode = UIViewContentModeScaleAspectFill;
        _smallImg.layer.cornerRadius = 50;
        _smallImg.clipsToBounds = YES;
        _smallImg.layer.masksToBounds = YES;
    }
    return _smallImg;
}

@end
