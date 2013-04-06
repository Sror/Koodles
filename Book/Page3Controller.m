//
//  Page3Controller.m
//  Book
//
//  Created by JRamos on 4/5/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import "Page3Controller.h"

@interface Page3Controller ()

@end

@implementation Page3Controller

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = @"Koodles is always very happy and has a BIG bright smile.";
    
}

@end
