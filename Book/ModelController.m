//
//  ModelController.m
//  Book
//
//  Created by JRamos on 4/5/13.
//  Copyright (c) 2013 JRamos. All rights reserved.
//

#import "ModelController.h"
#import "DataViewController.h"
#import "Page2Controller.h"
#import "Page3Controller.h"
#import "Page1Controller.h"

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
    }
    return self;
}

- (UIViewController *)viewControllerAtIndex:(NSUInteger)index2 storyboard:(UIStoryboard *)storyboard
{   
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0)) {
        return nil;
        NSLog(@"viewControllerAtIndex = 0");
    }
    else if (index2 == 0)
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
    
    // Create a new view controller and pass suitable data.
    DataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
    dataViewController.dataObject = self.pageData[index];
    NSLog(@"DataViewCointroller created");
    return dataViewController;
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
    NSLog(@"Index is: %d", index);
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    NSLog(@"Index is NOW: %d", index);
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSLog(@"Index is: %d", index);
    if ((index == 5) || (index == NSNotFound)) {
        return nil;
    }
    
    index++;
    NSLog(@"Index is NOW: %d", index);
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];

}

@end
