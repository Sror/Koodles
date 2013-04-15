//
//  Page2Controller.h
//  Book
//
//  Created by JRamos on 4/5/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Page2Controller : UIViewController <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *globe;
- (IBAction)goHome:(UIButton *)sender;

@property (strong, nonatomic) id dataObject;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;

-(void)addGestureRecognizer:(UIView *)img;

@end
