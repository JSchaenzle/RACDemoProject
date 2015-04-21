//
//  ViewController.m
//  JordansDemoApp
//
//  Created by Jordan Schaenzle on 4/20/15.
//  Copyright (c) 2015 Jordan Schaenzle. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    MainView *view = [MainView new];
    self.view = view;
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
