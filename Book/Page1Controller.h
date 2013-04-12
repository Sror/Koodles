//
//  Page1Controller.h
//  Book
//
//  Created by JRamos on 4/5/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Page1Controller : UIViewController
- (IBAction)goHome:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;

@end
