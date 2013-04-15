//
//  Page9Controller.m
//  Book
//
//  Created by JRamos on 4/13/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import "Page9Controller.h"
#import <AudioToolbox/AudioToolbox.h>

@interface Page9Controller ()

@end

@implementation Page9Controller{
    CGRect screenBound;
    CGSize screenSize;
    NSArray *zAnimation;
    NSArray *balloonAnimation;
    NSArray *owlAnimation;
    NSString *soundPath;
    SystemSoundID soundID;
    NSString *soundPath2;
    SystemSoundID soundID2;
    NSMutableArray *timerArray;

}

-(void) playSound {
    soundPath = [[NSBundle mainBundle] pathForResource:@"page9" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
    AudioServicesPlaySystemSound (soundID);
    [self setupTimers];

}

-(void) playCrickets {
    
    soundPath2 = [[NSBundle mainBundle] pathForResource:@"crickets" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: soundPath2], &soundID2);
    AudioServicesPlaySystemSound (soundID2);
    
}

- (void) viewWillDisappear:(BOOL)animated{
    AudioServicesDisposeSystemSoundID(soundID);
    AudioServicesDisposeSystemSoundID(soundID2);
    
    for (NSTimer *timers in timerArray) {
        [timers invalidate];
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //CGRect screenBound = [[UIScreen mainScreen] bounds];
    //CGSize screenSize = screenBound.size;
    
    zAnimation = [[NSArray alloc] initWithObjects:
                  [UIImage imageNamed:@"z1.png"],
                  [UIImage imageNamed:@"z2.png"],
                  [UIImage imageNamed:@"z3.png"],
                  [UIImage imageNamed:@"z4.png"],
                  [UIImage imageNamed:@"z5.png"],
                  [UIImage imageNamed:@"z6.png"],
                  nil];
    
    balloonAnimation = [[NSArray alloc] initWithObjects:
                        [UIImage imageNamed:@"balloon1.png"],
                        [UIImage imageNamed:@"balloon2.png"],
                        nil];
    
    owlAnimation = [[NSArray alloc] initWithObjects:
                        [UIImage imageNamed:@"owl.png"],
                        [UIImage imageNamed:@"owl2.png"],
                        [UIImage imageNamed:@"owl.png"],
                        [UIImage imageNamed:@"owl2.png"],
                        nil];
    
    
    timerArray = [[NSMutableArray alloc] init];

    
   
}

- (void)viewDidAppear:(BOOL)animated{

    //Set Animations
    [self animateBed];
    [self animateSleep];
    [self animateWindow];
    [self animateFurniture];
    [self animateWall];
    [self animateFloorBoard];
    [self animateFloor];
    [self animateMoon];
    [self animateClouds];
    [self animateBalloon];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:7
                                     target:self
                                   selector:@selector(animateOwl)
                                   userInfo:nil
                                    repeats:YES];
    [timerArray addObject:timer];
    
    NSMutableAttributedString *label = [[NSMutableAttributedString alloc] initWithString:@"He also loves to fall asleep so he can dream of tomorrow's adventures."];
    
    NSInteger stringLength = [label length];
    
    //Sets font. Notice: NSMakeRange(startingIndex, lengthofChars)
    UIFont *font = [UIFont fontWithName:@"Noteworthy-Light" size:52.0];
    [label addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, stringLength)];
    
    
    self.dataLabel.attributedText = label;
    
    NSTimer *timer2 = [NSTimer scheduledTimerWithTimeInterval:6
                                     target:self
                                   selector:@selector(playSound)
                                   userInfo:nil
                                    repeats:NO];
    [timerArray addObject:timer2];
    
    NSTimer *timer3 = [NSTimer scheduledTimerWithTimeInterval:3
                                     target:self
                                   selector:@selector(playCrickets)
                                   userInfo:nil
                                    repeats:NO];
    [timerArray addObject:timer3];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSMutableAttributedString *label = [[NSMutableAttributedString alloc] initWithString:@"He also loves to fall asleep so he can dream of tomorrow's adventures."];
    
    NSInteger stringLength = [label length];
    
    //Sets font. Notice: NSMakeRange(startingIndex, lengthofChars)
    UIFont *font = [UIFont fontWithName:@"Noteworthy-Light" size:52.0];
    [label addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, stringLength)];
    
    
    self.dataLabel.attributedText = label;
}

- (void)setupTimers{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"times" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *currentPage = [dict objectForKey:@"Page9"];
    
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
    
    
    [NSTimer scheduledTimerWithTimeInterval:6.2
                                     target:self
                                   selector:@selector(viewWillAppear:)
                                   userInfo:nil
                                    repeats:NO];
    
    
}

- (void)setupWords:(NSTimer*)sender{
    
    
    //Sends all page information to highlight the word
    NSString *path = [[NSBundle mainBundle] pathForResource:@"times" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *currentPage = [dict objectForKey:@"Page9"];
    
    NSString *convert = [NSString stringWithFormat:@"%@", sender.userInfo];
    NSNumber *wordIndex = [[currentPage objectForKey:(convert)] objectForKey:@"index"];
    NSNumber *wordLength = [[currentPage objectForKey:(convert)] objectForKey:@"length"];
    
    
    [self highlightWords:wordIndex :wordLength];
}

- (void)highlightWords:(NSNumber *)index :(NSNumber *)length{
    
    int wordIndex = [index intValue];
    int wordLength = [length intValue];
    //Setup label
    NSMutableAttributedString *label = [[NSMutableAttributedString alloc] initWithString:@"He also loves to fall asleep so he can dream of tomorrow's adventures."];
    NSInteger stringLength = [label length];
    
    //Iterate through plist
    //Sets font. Notice: NSMakeRange(startingIndex, lengthofChars)
    UIFont *font = [UIFont fontWithName:@"Noteworthy-Light" size:52.0];
    [label addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, stringLength)];
    
    [label addAttribute:NSBackgroundColorAttributeName
                  value:[UIColor colorWithRed:1 green:1 blue:.8 alpha:1]
                  range:NSMakeRange(wordIndex, wordLength)];
    
    
    self.dataLabel.attributedText = label;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)animateBed{
    
    CGPoint move;
    move.x = 150;
    move.y = 650;
    
    [UIView animateWithDuration:4 delay:2 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _bed.center = move;
        }
                     completion:^(BOOL completed){
                         NSLog(@"Bed animation Complete");
                     }
     ];
    
}

- (void)animateSleep{
    
    _zImage.animationImages=zAnimation;
    _zImage.animationDuration = 6;
    [_zImage startAnimating];
    
    CGPoint move;
    move.x = 280;
    move.y = 460;
    
    [UIView animateWithDuration:4 delay:2 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _zImage.center = move;
    }
                     completion:^(BOOL completed){
                         NSLog(@"Z's animation Complete");
                     }
     ];
    
    
}

- (void)animateWindow{
    
    CGPoint move;
    move.x = -400;
    move.y = 0;
    
    [UIView animateWithDuration:6 delay:3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _window.center = move;
    }
                     completion:^(BOOL completed){
                         NSLog(@"Window animation Complete");
                     }
     ];
    
}

- (void)animateFurniture{
    
    CGPoint move;
    move.x = 1400;
    move.y = _furniture.center.y;
    
    [UIView animateWithDuration:6 delay:3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _furniture.center = move;
    }
                     completion:^(BOOL completed){
                         NSLog(@"Furniture animation Complete");
                     }
     ];
    
}

- (void)animateWall{
    
    CGPoint move;
    move.x = _wall.center.x;
    move.y = -1000;
    
    [UIView animateWithDuration:6 delay:3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _wall.center = move;
    }
                     completion:^(BOOL completed){
                         NSLog(@"Wall animation Complete");
                     }
     ];
    
}

- (void)animateFloorBoard{
    
    CGPoint move;
    move.x = -1000;
    move.y = _floorBoard.center.y;
    
    [UIView animateWithDuration:4 delay:3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _floorBoard.center = move;
    }
                     completion:^(BOOL completed){
                         NSLog(@"FloorBoard animation Complete");
                     }
     ];
    
}

- (void)animateFloor{
    
    CGPoint move;
    move.x = _floor.center.x;
    move.y = 1000;
    
    [UIView animateWithDuration:4 delay:3 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _floor.center = move;
    }
                     completion:^(BOOL completed){
                         NSLog(@"Floor animation Complete");
                     }
     ];
    
}

- (void)animateMoon{
    
    CGPoint move;
    move.x = _moon.center.x;
    move.y = 150;
    
    [UIView animateWithDuration:12 delay:2 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _moon.center = move;
    }
                     completion:^(BOOL completed){
                         CGPoint move;
                         move.x = _moon.center.x;
                         move.y = 50;
                         [UIView animateWithDuration:12 delay:.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
                             _moon.center = move;
                         }
                                          completion:^(BOOL completed){
                                              [self animateMoon];
                                          }
                          ];
                     }
     ];
    
}

- (void)animateClouds{
    
    CGPoint move;
    move.x = 800;
    move.y = _cloudBig.center.y;
    
    [UIView animateWithDuration:60 delay:5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _cloudBig.center = move;
    }
                     completion:^(BOOL completed){
                         NSLog(@"CloudBig animation Complete");
                     }
     ];
    
    move.x = 650;
    move.y = _cloudMedium.center.y;
    
    [UIView animateWithDuration:20 delay:5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _cloudMedium.center = move;
    }
                     completion:^(BOOL completed){
                         NSLog(@"CloudMedium animation Complete");
                     }
     ];
    
    move.x = 90;
    move.y = 150;
    
    [UIView animateWithDuration:50 delay:5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _cloudBig2.center = move;
    }
                     completion:^(BOOL completed){
                         NSLog(@"CloudBig2 animation Complete");
                     }
     ];
    
}

- (void)animateBalloon{
    
    _balloon.animationImages=balloonAnimation;
    _balloon.animationDuration = .5;
    [_balloon startAnimating];
    
    CGPoint move;
    move.x = 400;
    move.y = 150;
    
    [UIView animateWithDuration:20 delay:6 options:UIViewAnimationOptionCurveEaseOut animations:^{
        _balloon.center = move;
    }
                     completion:^(BOOL completed){
                         CGPoint move;
                         move.x = 900;
                         move.y = 100;
                         
                         [UIView animateWithDuration:40 delay:.3 options:UIViewAnimationOptionCurveEaseOut animations:^{
                             _balloon.center = move;
                         }
                                          completion:^(BOOL completed){
                                              [self animateBalloon];
                                          }
                          ];
                     }
     ];
    
}

- (void)animateOwl{
    
    _owl.animationImages=owlAnimation;
    _owl.animationDuration = .4;
    _owl.animationRepeatCount = 1;
    [_owl startAnimating];

    
}


- (IBAction)goHome:(UIButton *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
