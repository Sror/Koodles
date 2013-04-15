//
//  Page9Controller.h
//  Book
//
//  Created by JRamos on 4/13/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Page9Controller : UIViewController
- (IBAction)goHome:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (weak, nonatomic) IBOutlet UIImageView *owl;
@property (weak, nonatomic) IBOutlet UIImageView *balloon;
@property (weak, nonatomic) IBOutlet UIImageView *cloudBig2;
@property (weak, nonatomic) IBOutlet UIImageView *cloudMedium;
@property (weak, nonatomic) IBOutlet UIImageView *cloudBig;
@property (weak, nonatomic) IBOutlet UIImageView *moon;
@property (weak, nonatomic) IBOutlet UIImageView *floor;
@property (weak, nonatomic) IBOutlet UIImageView *floorBoard;
@property (weak, nonatomic) IBOutlet UIImageView *wall;
@property (weak, nonatomic) IBOutlet UIImageView *furniture;
@property (weak, nonatomic) IBOutlet UIImageView *window;
@property (weak, nonatomic) IBOutlet UIImageView *zImage;
@property (weak, nonatomic) IBOutlet UIImageView *bed;

@end
