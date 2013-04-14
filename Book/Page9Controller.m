//
//  Page9Controller.m
//  Book
//
//  Created by JRamos on 4/13/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import "Page9Controller.h"

@interface Page9Controller ()

@end

@implementation Page9Controller{
    CGRect screenBound;
    CGSize screenSize;
    NSArray *zAnimation;
    NSArray *balloonAnimation;
    NSArray *owlAnimation;
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
    
    [NSTimer scheduledTimerWithTimeInterval:7
                                     target:self
                                   selector:@selector(animateOwl)
                                   userInfo:nil
                                    repeats:YES];
    
    self.dataLabel.text = @"He also loves to fall asleep so he can dream of tomorrow's adventures.";

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


@end
