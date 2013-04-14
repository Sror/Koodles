//
//  Page2Controller.m
//  Book
//
//  Created by JRamos on 4/5/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import "Page2Controller.h"
#import <AudioToolbox/AudioToolbox.h>

@interface Page2Controller ()

@end

@implementation Page2Controller{
    NSString *soundPath;
    SystemSoundID soundID;
}

- (void)viewDidAppear:(BOOL)animated{
    [self playSound];
}

-(void) playSound {
    soundPath = [[NSBundle mainBundle] pathForResource:@"page2" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
    AudioServicesPlaySystemSound (soundID);
    
}

- (void) viewWillDisappear:(BOOL)animated{
    AudioServicesDisposeSystemSoundID(soundID);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //NSLog(@"Page2Controller did load");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     self.dataLabel.text = @"Way out WEST lives the most adorable, friendly, chubby bear named Koodles.";
}

- (IBAction)goHome:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end

