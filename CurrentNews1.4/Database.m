//
//  Database.m
//  Database
//
//  Created by Support on 2/26/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Database.h"


@implementation Database



-(void) copyRssFeedsFromMainBundleToDocuments{
	
	databaseName = [NSString stringWithString:@"RSSFeeds.sqlite"];
    
	NSFileManager *fileManager = [NSFileManager defaultManager];
	
	NSString *sourcePath = [[NSBundle mainBundle] resourcePath];
	sourcePath = [sourcePath stringByAppendingPathComponent:databaseName];
	
	NSArray *documentsPath = NSSearchPathForDirectoriesInDomains
	(NSDocumentDirectory, NSUserDomainMask, YES);
	destinitionPath = [documentsPath objectAtIndex:0];
	destinitionPath = 
	[destinitionPath stringByAppendingPathComponent:databaseName];
	
	if (![fileManager fileExistsAtPath:destinitionPath])
	{
		[fileManager copyItemAtPath:sourcePath 
							 toPath:destinitionPath error:nil];
	}
	
    
    
}

-(NSMutableArray *)readRSSFeedsFromDatabase{
	
	sqlite3 *database;
	NSMutableArray *rssFeedsList = [[NSMutableArray alloc] init] ;
	
	if ( sqlite3_open([destinitionPath UTF8String] , &database) == SQLITE_OK)
	{
		NSString *query = @"select * from tblFeed";
		
		sqlite3_stmt *compiledStatement;
		
		if (sqlite3_prepare_v2
			(database, [query UTF8String], -1, &compiledStatement, NULL) == SQLITE_OK)
		{
			while ( sqlite3_step(compiledStatement) == SQLITE_ROW )
			{
				RSSFeed *rssFeed = [[RSSFeed alloc] init];
                            
                rssFeed.title = [NSString stringWithUTF8String: (char *) sqlite3_column_text(compiledStatement, 1)];
				rssFeed.rssLink = [NSString stringWithUTF8String: (char *) sqlite3_column_text(compiledStatement, 2)];
                
				[rssFeedsList addObject:rssFeed];
			}
		}
		sqlite3_close(database);
	}
	return rssFeedsList;
    
}




@end
