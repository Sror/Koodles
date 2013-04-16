//
//  DataViewController.m
//  Test
//
//  Created by JRamos on 4/10/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import "DataViewController.h"
#import "AppDelegate.h"

@interface DataViewController ()

@end

@implementation DataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
    AppDelegate* app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [app setValue:50];

}

@end
