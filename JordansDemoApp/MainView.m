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

     }

     [self addSubview:_titleLabel];

     [self setNeedsUpdateConstraints];
     return self;
 }


- (void)updateConstraints {

    [super updateConstraints];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).offset(50);
    }];

}


@end