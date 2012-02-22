//
//  MOORefreshView.h
//  MOOPullGesture
//
//  Created by Peyton Randolph on 2/20/12
//  Inspired by Pier-Olivier Thibault's [PHRefreshTriggerView](https://github.com/pothibo/PHRefreshTriggerView)
//

#import <UIKit/UIKit.h>

#import "Support/ARCHelper.h"
#import "MOOPullGestureRecognizer.h"
#import "MOOTriggerView.h"

@class MOOCreateView;

@protocol MOOCreateViewDelegate <NSObject>

@optional
- (void)createView:(MOOCreateView *)createView configureCell:(UITableViewCell *)cell forState:(MOOPullState)state;

@end

@interface MOOCreateView : UIView <MOOTriggerView> 
{
    __unsafe_unretained id<MOOCreateViewDelegate> _delegate;
    
    UITableViewCell *_cell;
}

@property (nonatomic, unsafe_unretained) id<MOOCreateViewDelegate> delegate;
@property (nonatomic, strong, readonly) UITableViewCell *cell;

- (id)initWithCellClass:(Class)cellClass style:(UITableViewCellStyle)style;

@end
