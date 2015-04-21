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
#import "RACSignal.h"
#import "RACChannel.h"
#import "RACKVOChannel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    MainView *view = [MainView new];
    self.view = view;

    RACChannelTerminal *textField1Channel = [view.textField1 rac_newTextChannel];

    RACChannelTerminal *textField2Channel = [view.textField2 rac_newTextChannel];

    [textField1Channel subscribe:textField2Channel];
    [textField2Channel subscribe:textField1Channel];
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
