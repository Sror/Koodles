//
//  Title.m
//  Book
//
//  Created by JRamos on 4/5/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import "Title.h"
#import "RootViewController.h"
#import "NibViewController.h"
#import <QuartzCore/QuartzCore.h>

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
    
    _koodles.userInteractionEnabled = YES;
    [self addGestureRecognizer:_koodles];
    
}

-(void)addGestureRecognizer:(UIView *)img{
    

    UIPanGestureRecognizer *pr = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panImg:)];
    [pr setDelegate:self];
    [img addGestureRecognizer:pr];
    
    UIRotationGestureRecognizer *rt = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateImg:)];
    [img addGestureRecognizer:rt];
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
    //[self adjustAnchor:gr];
    
    if([gr state] == UIGestureRecognizerStateBegan || [gr state] == UIGestureRecognizerStateChanged){
        [gr view].transform = CGAffineTransformRotate([[gr view] transform], [gr rotation]);
        [gr setRotation:0];
    }
    
}

-(void)panImg:(UIPanGestureRecognizer *)gr{
    
    UIView *img = [gr view];
    [[img superview] bringSubviewToFront:img];
    
    //[self adjustAnchor:gr];
    
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

- (IBAction)About:(UIButton *)sender {
    
    NibViewController *nvc = [[NibViewController alloc] initWithNibName:@"NibViewController" bundle:nil];
    [self.navigationController pushViewController:nvc animated:YES];
    [nvc setModalTransitionStyle: UIModalTransitionStyleFlipHorizontal];
    
}

- (IBAction)Play:(UIButton *)sender {
    
    
//    RootViewController *pages = [[self storyboard] instantiateViewControllerWithIdentifier:@"Root"];
//    [self presentViewController:pages animated:YES completion:^{
//        NSLog(@"RootViewController did load");
//    }];
    
   
}
@end
