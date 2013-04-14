//
//  Page1Controller.m
//  Book
//
//  Created by JRamos on 4/5/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import "Page1Controller.h"
#import <AudioToolbox/AudioToolbox.h>

@interface Page1Controller ()

@end

@implementation Page1Controller{
NSString *soundPath;
SystemSoundID soundID;
}

- (void)viewDidAppear:(BOOL)animated{
    [self playSound];
}

-(void) playSound {
    soundPath = [[NSBundle mainBundle] pathForResource:@"title" ofType:@"wav"];
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

}

- (IBAction)goHome:(UIButton *)sender {
        [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
