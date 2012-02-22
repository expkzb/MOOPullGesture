//
//  PullToCreateViewController.m
//  MOOPullGesture Demo
//
//  Created by Peyton Randolph on 2/21/12.
//

#import "PullToCreateViewController.h"

#import "PullToCreateDataSource.h"
#import "PullToCreateDelegate.h"

#import "MOOPullGestureRecognizer.h"
#import "MOOCreateView.h"

@interface PullToCreateViewController ()

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer;
- (void)_resetPullRecognizer:(UIGestureRecognizer<MOOPullGestureRecognizer> *)pullGestureRecognizer;

@end

@implementation PullToCreateViewController

- (id)initWithDataSource:(PullToCreateDataSource *)dataSource delegate:(PullToCreateDelegate *)delegate;
{
    if (!(self = [super initWithStyle:UITableViewStylePlain]))
        return nil;
    
    // Retain data source and delegate
    _dataSource = dataSource;
    _delegate = delegate;
    
    // Configure tab bar
    self.title = NSLocalizedString(@"Pull to Create", @"Pull to Create");
    self.tabBarItem.image = [UIImage imageNamed:@"Arrow-Bucket.png"];
    
    // Configure table view
    self.tableView.dataSource = dataSource;
    self.tableView.delegate = delegate;
    
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
	
    // Add pull gesture recognizer
    MOOPullGestureRecognizer *recognizer = [[MOOPullGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    recognizer.triggerView = [[MOOCreateView alloc] initWithCellClass:[UITableViewCell class] style:UITableViewCellStyleDefault];
    [self.tableView addGestureRecognizer:recognizer];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - MOOPullGestureRecognizer targets

- (void)handleGesture:(UIGestureRecognizer *)gestureRecognizer;
{
    if (gestureRecognizer.state == UIGestureRecognizerStateRecognized) {
        if ([gestureRecognizer conformsToProtocol:@protocol(MOOPullGestureRecognizer)])
            [self _resetPullRecognizer:(UIGestureRecognizer<MOOPullGestureRecognizer> *)gestureRecognizer];
    }
}

- (void)_resetPullRecognizer:(UIGestureRecognizer<MOOPullGestureRecognizer> *)pullGestureRecognizer;
{
    [pullGestureRecognizer resetPullState];
}

@end
