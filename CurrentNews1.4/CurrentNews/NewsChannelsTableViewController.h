//
//  NewsChannelsTableViewController.h
//  CurrentNews
//
//  Created by Faizan on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"


@interface NewsChannelsTableViewController : UITableViewController
/*{
    UIActivityIndicatorView *Indicator;
}
*/
@property (nonatomic, retain) NSMutableArray *rssFeedsList;

@property (strong, nonatomic) Database *database;

@end
