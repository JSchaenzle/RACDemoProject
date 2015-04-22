//
//  ViewController.m
//  JordansDemoApp
//
//  Created by Jordan Schaenzle on 4/20/15.
//  Copyright (c) 2015 Jordan Schaenzle. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"
#import "ReactiveCocoa.h"

@implementation ViewController

- (void)loadView {
    const NSNumber *minHeatTemp = @75.0;
    const NSNumber *maxACTemp = @25.0;

    MainView *view = [MainView new];
    self.view = view;

    RACChannelTerminal *sliderTerminal = [view.slider rac_newValueChannelWithNilValue:@0];
    RACChannelTerminal *heatSwitchTerminal = view.heatSwitch.rac_newOnChannel;
    RACChannelTerminal *acSwitchTerminal = view.acSwitch.rac_newOnChannel;

    RACSignal *forceHeatSignal = [heatSwitchTerminal map:^id(id value) {
        NSLog(@"heatSwitch sent %@", value);
        return [value boolValue] ? minHeatTemp : @([minHeatTemp floatValue] - 1);
    }];

    RACSignal *forceACSignal = [acSwitchTerminal map:^id(id value) {
        NSLog(@"acSwitch sent %@", value);
        return [value boolValue] ? maxACTemp : @([maxACTemp floatValue] + 1);
    }];

    [[RACSignal merge:@[forceHeatSignal, forceACSignal]] subscribe:sliderTerminal];

    RACSignal *heatOnSignal = [[sliderTerminal map:^id(id value) {
        return @([value floatValue] > [minHeatTemp floatValue]);
    }] merge:[[acSwitchTerminal not] ignore:@YES]];

    [heatOnSignal subscribe:heatSwitchTerminal];

    RACSignal *acOnSignal = [[sliderTerminal map:^id(id value) {
        return @([value floatValue] < [maxACTemp floatValue]);
    }] merge:[[heatSwitchTerminal not] ignore:@YES]];

    [acOnSignal subscribe:acSwitchTerminal];

    RAC(view.heatLabel, text) = [[heatOnSignal merge:heatSwitchTerminal] map:^id(id value) {
        return [value boolValue] ? @"Heat On" : @"Heat Off";
    }];

    RAC(view.acLabel, text) = [[acOnSignal merge:acSwitchTerminal] map:^id(id value) {
        return [value boolValue] ? @"A/C On" : @"A/C Off";
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

