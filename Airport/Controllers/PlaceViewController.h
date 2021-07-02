//
//  PlaceViewController.h
//  Airport
//
//  Created by Сергей Васильев on 16.06.2021.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"

typedef enum PlaceType {
    PlaceTypeArrival,
    PlaceTypeDeparture
} PlaceType;


@protocol PalceViewControllerDelegate <NSObject>

-(void)selectPlace:(id)place withType:(PlaceType)placeType andDataType:(DataSourceType)dataType;

@end


@interface PlaceViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating>

@property (nonatomic, strong) id<PalceViewControllerDelegate>delegate;
-(instancetype)initWithType:(PlaceType)type;

@end


