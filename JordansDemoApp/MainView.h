//
// Created by Jordan Schaenzle on 4/20/15.
// Copyright (c) 2015 Jordan Schaenzle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class SimplePickerView;

@interface MainView : UIView
//@property (nonatomic, strong) UITextField *textField;
//@property (nonatomic, strong) SimplePickerView *picker;
//@property (nonatomic, strong) UIButton *clearButton;

@property (nonatomic, strong) UISlider *slider;
@property (nonatomic, strong) UISwitch *heatSwitch;
@property (nonatomic, strong) UISwitch *acSwitch;
@property (nonatomic, strong) UILabel *heatLabel;
@property (nonatomic, strong) UILabel *acLabel;


@end