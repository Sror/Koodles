//
//  Page2Controller.m
//  Book
//
//  Created by JRamos on 4/5/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import "Page2Controller.h"
#import <AudioToolbox/AudioToolbox.h>
#import <QuartzCore/QuartzCore.h>

@interface Page2Controller ()

@end

@implementation Page2Controller{
    NSString *soundPath;
    SystemSoundID soundID;
    NSMutableArray *timerArray;
}

- (void)viewDidAppear:(BOOL)animated{
    [self performSelector:@selector(playSound) withObject:nil afterDelay:.2];

}

-(void) playSound {
    soundPath = [[NSBundle mainBundle] pathForResource:@"page2" ofType:@"wav"];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //NSLog(@"Page2Controller did load");
    timerArray = [[NSMutableArray alloc] init];
    
    //_globe.userInteractionEnabled = YES;
    //[self addGestureRecognizer:_globe];
    
    
}

-(void)addGestureRecognizer:(UIView *)img{
    
    UIRotationGestureRecognizer *rt = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateImg:)];
    [img addGestureRecognizer:rt];
    
    UIPanGestureRecognizer *pr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panImg:)];
    [pr setDelegate:self];
    [img addGestureRecognizer:pr];
}

-(void)adjustAnchor:(UIGestureRecognizer *)gr{
    if (gr.state == UIGestureRecognizerStateBegan){
        UIView *img = gr.view;
        CGPoint locView = [gr locationInView:img];
        CGPoint locSuperView = [gr locationInView:img.superview];
        
        img.layer.anchorPoint = CGPointMake(locView.x / img.bounds.size.width, locSuperView.y / img.bounds.size.height);
        img.center = locSuperView;
    }
}

-(void)rotateImg:(UIRotationGestureRecognizer *)gr{
    [self adjustAnchor:gr];
    
    if([gr state] == UIGestureRecognizerStateBegan || [gr state] == UIGestureRecognizerStateChanged){
        [gr view].transform = CGAffineTransformRotate([[gr view] transform], [gr rotation]);
        [gr setRotation:0];
    }
    
}

-(void)panImg:(UIPanGestureRecognizer *)gr{
    
    UIView *img = [gr view];
    [[img superview] bringSubviewToFront:img];
    
    [self adjustAnchor:gr];
    
    if([gr state] == UIGestureRecognizerStateBegan || [gr state] == UIGestureRecognizerStateChanged){
        CGPoint translation = [gr translationInView:[img superview]];
        
        [img setCenter:CGPointMake([img center].x + translation.x, [img center].y + translation.y)];
        [gr setTranslation:CGPointZero inView:[img superview]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSMutableAttributedString *label = [[NSMutableAttributedString alloc] initWithString:@"Way out WEST lives the most adorable, friendly, chubby bear named Koodles."];
    
    NSInteger stringLength = [label length];
    
    //Sets font. Notice: NSMakeRange(startingIndex, lengthofChars)
    UIFont *font = [UIFont fontWithName:@"GurmukhiMN-Bold" size:35.0];
    [label addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, stringLength)];
    
    
    self.dataLabel.attributedText = label;


}

- (void)setupTimers{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"times" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *currentPage = [dict objectForKey:@"Page2"];
    
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
    
    
    [NSTimer scheduledTimerWithTimeInterval:8
                                     target:self
                                   selector:@selector(viewWillAppear:)
                                   userInfo:nil
                                    repeats:NO];


}

- (void)setupWords:(NSTimer*)sender{
    
    
    //Sends all page information to highlight the word
    NSString *path = [[NSBundle mainBundle] pathForResource:@"times" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSDictionary *currentPage = [dict objectForKey:@"Page2"];
    
    NSString *convert = [NSString stringWithFormat:@"%@", sender.userInfo];
    NSNumber *wordIndex = [[currentPage objectForKey:(convert)] objectForKey:@"index"];
    NSNumber *wordLength = [[currentPage objectForKey:(convert)] objectForKey:@"length"];

    
    [self highlightWords:wordIndex :wordLength];
}

- (void)highlightWords:(NSNumber *)index :(NSNumber *)length{
    
    int wordIndex = [index intValue];
    int wordLength = [length intValue];
    //Setup label
    NSMutableAttributedString *label = [[NSMutableAttributedString alloc] initWithString:@"Way out WEST lives the most adorable, friendly, chubby bear named Koodles."];
    
    NSInteger stringLength = [label length];
    
    //Iterate through plist
    //Sets font. Notice: NSMakeRange(startingIndex, lengthofChars)
    UIFont *font = [UIFont fontWithName:@"GurmukhiMN-Bold" size:35.0];
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

