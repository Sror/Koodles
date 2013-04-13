//
//  Page8Controller.m
//  Book
//
//  Created by JRamos on 4/13/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import "Page8Controller.h"

@interface Page8Controller ()

@end

@implementation Page8Controller

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
    self.dataLabel.text = @"Koodles loves to climb into his big fluffy bed with his favorite stuffed bunny rabbit.";
}

@end
