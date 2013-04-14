//
//  Page3Controller.m
//  Book
//
//  Created by JRamos on 4/5/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import "Page3Controller.h"
#import <AudioToolbox/AudioToolbox.h>

@interface Page3Controller ()

@end

@implementation Page3Controller{
    NSString *soundPath;
    SystemSoundID soundID;
}

- (void)viewDidAppear:(BOOL)animated{
    [self playSound];
}

-(void) playSound {
    soundPath = [[NSBundle mainBundle] pathForResource:@"page3" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
    AudioServicesPlaySystemSound (soundID);
    
}

- (void) viewWillDisappear:(BOOL)animated{
    AudioServicesDisposeSystemSoundID(soundID);
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
    self.dataLabel.text = @"Koodles is always very happy and has a BIG bright smile.";
    
}

- (IBAction)goHome:(UIButton *)sender {
        [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
