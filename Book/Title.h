//
//  Title.h
//  Book
//
//  Created by JRamos on 4/5/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Title : UIViewController <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *koodles;
- (IBAction)About:(UIButton *)sender;
- (IBAction)Play:(UIButton *)sender;

-(void)addGestureRecognizer:(UIView *)img;

@end
