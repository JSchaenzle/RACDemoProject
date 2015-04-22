//
// Created by Jordan Schaenzle on 4/20/15.
// Copyright (c) 2015 Jordan Schaenzle. All rights reserved.
//

#import "MainView.h"
#import "View+MASAdditions.h"

@interface MainView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *temperatureLabel;
@end

@implementation MainView

 - (instancetype)init {
     if (self = [super initWithFrame:CGRectZero]) {
         self.backgroundColor = [UIColor whiteColor];

         _titleLabel = [UILabel new];
         _titleLabel.text = @"Jordan's Demo App";
         _titleLabel.textAlignment = NSTextAlignmentCenter;

         _temperatureLabel = [UILabel new];
         _temperatureLabel.text = @"Temperature Setting:";
         _temperatureLabel.textAlignment = NSTextAlignmentCenter;

         _slider = [UISlider new];
         _slider.minimumValue = 0;
         _slider.maximumValue = 100;
         _slider.continuous = YES;

         _heatSwitch = [UISwitch new];
         _heatLabel = [UILabel new];

         _acSwitch = [UISwitch new];
         _acLabel = [UILabel new];
     }

     [self addSubview:_titleLabel];
     [self addSubview:_temperatureLabel];
     [self addSubview:_slider];
     [self addSubview:_heatSwitch];
     [self addSubview:_acSwitch];
     [self addSubview:_heatLabel];
     [self addSubview:_acLabel];

     [self setNeedsUpdateConstraints];
     return self;
 }


- (void)updateConstraints {

    [super updateConstraints];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).offset(50);
        make.width.equalTo(self.mas_width).multipliedBy(0.9);
        make.height.equalTo(@30);
    }];

    [self.temperatureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).offset(150);
        make.width.equalTo(self.mas_width).multipliedBy(0.9);
        make.height.equalTo(@30);
    }];

    [self.slider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.temperatureLabel.mas_bottom).offset(5);
        make.centerX.equalTo(self.mas_centerX);
        make.width.equalTo(self.mas_width).multipliedBy(0.8);
    }];

    [self.heatSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.slider.mas_bottom).offset(20);
        make.centerX.equalTo(self.mas_centerX);
    }];

    [self.heatLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.heatSwitch.mas_centerY);
        make.left.equalTo(self.heatSwitch.mas_right).offset(10);
    }];

    [self.acSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.heatSwitch.mas_bottom).offset(20);
        make.centerX.equalTo(self.mas_centerX);
    }];

    [self.acLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.acSwitch.mas_centerY);
        make.left.equalTo(self.acSwitch.mas_right).offset(10);
    }];

}


@end