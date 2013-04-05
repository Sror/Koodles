//
//  Title.m
//  Book
//
//  Created by JRamos on 4/5/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import "Title.h"
#import "RootViewController.h"

@interface Title ()

@end

@implementation Title

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

- (IBAction)Play:(UIButton *)sender {
    
    
    RootViewController *pages = [[self storyboard] instantiateViewControllerWithIdentifier:@"Root"];
    [self presentViewController:pages animated:YES completion:^{
        NSLog(@"RootViewController did load");
    }];
    
   
}

- (void)dismissCurrentView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
