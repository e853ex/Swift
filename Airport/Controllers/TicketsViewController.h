//
//  TicketsViewController.h
//  Airport
//
//  Created by Сергей Васильев on 16.06.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TicketsViewController : UITableViewController
- (instancetype)initWithTickets:(NSArray *)tickets;
@end

NS_ASSUME_NONNULL_END
