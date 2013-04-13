//
//  ModelController.m
//  Book
//
//  Created by JRamos on 4/5/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import "ModelController.h"
#import "DataViewController.h"
#import "Page8Controller.h"
#import "Page7Controller.h"
#import "Page6Controller.h"
#import "Page5Controller.h"
#import "Page4Controller.h"
#import "Page2Controller.h"
#import "Page3Controller.h"
#import "Page1Controller.h"
#import "AppDelegate.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */

@interface ModelController()
@property (readonly, strong, nonatomic) NSArray *pageData;
@end

@implementation ModelController
{
    NSUInteger index;
    BOOL pageForward;
    BOOL pageBack;
}

- (id)init
{
    self = [super init];
    if (self) {
        // Create the data model.
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        _pageData = [[dateFormatter monthSymbols] copy];
        index = 0;
        NSLog(@"%@", _pageData);
        pageBack = NO;
        pageForward = NO;
    }
    return self;
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index2 storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.

    if (index2 == 0)
    {
        Page1Controller *p1 = [storyboard instantiateViewControllerWithIdentifier:@"Page1"];
        
        return p1;
    }
    else if (index2 == 1)
    {
        Page2Controller *p2 = [storyboard instantiateViewControllerWithIdentifier:@"Page2"];
        
        return p2;
    }
    else if (index2 == 2){
        Page3Controller *p3 = [storyboard instantiateViewControllerWithIdentifier:@"Page3"];
        return p3;
    }
    
    else if (index2 == 3){
        Page4Controller *p4 = [storyboard instantiateViewControllerWithIdentifier:@"Page4"];
        return p4;
    }
    else if (index2 == 4){
        Page5Controller *p5 = [storyboard instantiateViewControllerWithIdentifier:@"Page5"];
        return p5;
    }
    else if (index2 == 5){
        Page6Controller *p6 = [storyboard instantiateViewControllerWithIdentifier:@"Page6"];
        return p6;
    }
    else if (index2 == 6){
        Page7Controller *p7 = [storyboard instantiateViewControllerWithIdentifier:@"Page7"];
        return p7;
    }
    else if (index2 == 7){
        Page8Controller *p8 = [storyboard instantiateViewControllerWithIdentifier:@"Page8"];
        return p8;
    }
    
//    // Create a new view controller and pass suitable data.
//    DataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
//    dataViewController.dataObject = self.pageData[index];
//    NSLog(@"DataViewCointroller created");
    return nil;
}

- (NSUInteger)indexOfViewController:(DataViewController *)viewController
{   
     // Return the index of the given data view controller.
     // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.dataObject];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    
    AppDelegate* app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    BOOL pageTurned = [app getPageTurned];
    
    if(pageForward){
        if(!pageTurned){
            index--;
        }
    }
    pageForward = NO;
    
    if(pageBack){
        if(!pageTurned){
            index++;
        }
    }
    
    NSLog(@"Index Current: %d", index);
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    NSLog(@"Index Next: %d", index);
    pageBack = YES;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{

    AppDelegate* app = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    BOOL pageTurned = [app getPageTurned];
    
    if(pageBack){
        if(!pageTurned){
            index++;
        }
    }
    pageBack = NO;
    
    if(pageForward){
        if(!pageTurned){
            index--;
        }
    }

    NSLog(@"Index Current: %d", index);
    if ((index == 10) || (index == NSNotFound)) {
        return nil;
    }
    
    index++;
    NSLog(@"Index Next: %d", index);
    pageForward = YES;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];

}

@end
