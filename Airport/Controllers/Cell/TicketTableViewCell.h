//
//  TicketTableViewCell.h
//  Airport
//
//  Created by Сергей Васильев on 16.06.2021.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "APIManager.h"
#import "Ticket.h"


NS_ASSUME_NONNULL_BEGIN

@interface TicketTableViewCell : UITableViewCell
@property (nonatomic, strong) Ticket *ticket;
@end

NS_ASSUME_NONNULL_END
