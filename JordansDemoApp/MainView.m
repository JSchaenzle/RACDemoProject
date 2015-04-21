//
// Created by Jordan Schaenzle on 4/20/15.
// Copyright (c) 2015 Jordan Schaenzle. All rights reserved.
//

#import "MainView.h"
#import "View+MASAdditions.h"

@interface MainView ()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation MainView

 - (instancetype)init {
     if (self = [super initWithFrame:CGRectZero]) {
         self.backgroundColor = [UIColor whiteColor];

         _titleLabel = [UILabel new];
         _titleLabel.text = @"Jordan's Demo App";

         _textField1 = [UITextField new];
         _textField1.layer.borderColor = [UIColor blackColor].CGColor;
         _textField1.layer.borderWidth = 1;

         _textField2 = [UITextField new];
         _textField2.layer.borderColor = [UIColor blackColor].CGColor;
         _textField2.layer.borderWidth = 1;

     }

     [self addSubview:_titleLabel];
     [self addSubview:_textField1];
     [self addSubview:_textField2];

     [self setNeedsUpdateConstraints];
     return self;
 }


- (void)updateConstraints {

    [super updateConstraints];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).offset(50);
    }];

    [self.textField1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.titleLabel.mas_centerX);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(20);
        make.width.equalTo(self.mas_width).multipliedBy(0.9);
    }];

    [self.textField2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.titleLabel.mas_centerX);
        make.top.equalTo(self.textField1.mas_bottom).offset(20);
        make.width.equalTo(self.mas_width).multipliedBy(0.9);
    }];

}


@end