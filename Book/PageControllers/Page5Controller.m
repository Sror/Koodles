//
//  Page5Controller.m
//  Book
//
//  Created by JRamos on 4/12/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import "Page5Controller.h"

@interface Page5Controller ()

@end

@implementation Page5Controller

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

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
    self.dataLabel.text = @"He also likes spending time with his friends. They play games and sports together.";
    
}

@end
