//
//  Page4Controller.m
//  Book
//
//  Created by JRamos on 4/10/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import "Page4Controller.h"
#import <AudioToolbox/AudioToolbox.h>

@interface Page4Controller ()

@end

@implementation Page4Controller{
    NSString *soundPath;
    SystemSoundID soundID;
    NSMutableArray *timerArray;

}

- (void)viewDidAppear:(BOOL)animated{
    [self performSelector:@selector(playSound) withObject:nil afterDelay:.2];
}

-(void) playSound {
    soundPath = [[NSBundle mainBundle] pathForResource:@"page4" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
    AudioServicesPlaySystemSound (soundID);
    [self setupTimers];
    
}

- (void) viewWillDisappear:(BOOL)animated{
    AudioServicesDisposeSystemSoundID(soundID);
    
    for (NSTimer *timers in timerArray) {
        [timers invalidate];
    }
}

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
    timerArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSMutableAttributedString *label = [[NSMutableAttributedString alloc] initWithString:@"Koodles loves going to school. He loves to learn new things, play outside during recess, and make new friends!"];
    
    NSInteger stringLength = [label length];
    
    //Sets font. Notice: NSMakeRange(startingIndex, lengthofChars)
    UIFont *font = [UIFont fontWithName:@"Chalkduster" size:27.0];
    [label addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, stringLength)];
    
    
    self.dataLabel.attributedText = label;
    
}

- (void)setupTimers{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"times" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *currentPage = [dict objectForKey:@"Page4"];
    
    //NSInteger dictCount = [currentPage count];
    
    //Iterate through plist and set timers up
    NSUInteger count = 0;
    for (NSDictionary *dicts in currentPage) {
        NSString *convert = [NSString stringWithFormat:@"%d", count];
        NSNumber *start = [[currentPage objectForKey:(convert)] objectForKey:@"start"];
        double startT = [start doubleValue];
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:startT
                                                          target:self
                                                        selector:@selector(setupWords:)
                                                        userInfo:(convert)
                                                         repeats:NO];
        
        count++;
        [timerArray addObject:timer];
        
    }
    
    
    [NSTimer scheduledTimerWithTimeInterval:12.2
                                     target:self
                                   selector:@selector(viewWillAppear:)
                                   userInfo:nil
                                    repeats:NO];
    
    
}

- (void)setupWords:(NSTimer*)sender{
    
    
    //Sends all page information to highlight the word
    NSString *path = [[NSBundle mainBundle] pathForResource:@"times" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *currentPage = [dict objectForKey:@"Page4"];
    
    NSString *convert = [NSString stringWithFormat:@"%@", sender.userInfo];
    NSNumber *wordIndex = [[currentPage objectForKey:(convert)] objectForKey:@"index"];
    NSNumber *wordLength = [[currentPage objectForKey:(convert)] objectForKey:@"length"];
    
    
    [self highlightWords:wordIndex :wordLength];
}

- (void)highlightWords:(NSNumber *)index :(NSNumber *)length{
    
    int wordIndex = [index intValue];
    int wordLength = [length intValue];
    //Setup label
    NSMutableAttributedString *label = [[NSMutableAttributedString alloc] initWithString:@"Koodles loves going to school. He loves to learn new things, play outside during recess, and make new friends!"];
    
    NSInteger stringLength = [label length];
    
    //Iterate through plist
    //Sets font. Notice: NSMakeRange(startingIndex, lengthofChars)
    UIFont *font = [UIFont fontWithName:@"Chalkduster" size:27.0];
    [label addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, stringLength)];
    
    [label addAttribute:NSBackgroundColorAttributeName
                  value:[UIColor colorWithRed:1 green:1 blue:.8 alpha:1]
                  range:NSMakeRange(wordIndex, wordLength)];
    
    
    self.dataLabel.attributedText = label;
    
}
- (IBAction)goHome:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
