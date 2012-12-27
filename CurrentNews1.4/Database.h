//
//  Database.h
//  Database
//
//  Created by Support on 2/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "RSSFeed.h"


@interface Database : NSObject {
	
	NSString *databaseName;
	NSString *destinitionPath;
    
}

-(void) copyRssFeedsFromMainBundleToDocuments;
-(NSMutableArray *)readRSSFeedsFromDatabase;


@end
