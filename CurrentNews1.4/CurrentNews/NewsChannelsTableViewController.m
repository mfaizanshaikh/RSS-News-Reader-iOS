//
//  NewsChannelsTableViewController.m
//  CurrentNews
//
//  Created by Faizan on 7/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NewsChannelsTableViewController.h"
#import "RSSFeed.h"
#import "HeadingsViewController.h"

@implementation NewsChannelsTableViewController

@synthesize database = _database;
@synthesize rssFeedsList = _rssFeedsList;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
} 

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"News";
    self.clearsSelectionOnViewWillAppear = NO;
    self.database = [[Database alloc] init];
	[self.database copyRssFeedsFromMainBundleToDocuments];
    self.rssFeedsList =[self.database readRSSFeedsFromDatabase];
    
   /* Indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    Indicator.frame = CGRectMake(0, 0, 24, 24);
    Indicator.hidden=YES;
    */
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.rssFeedsList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    RSSFeed *rssFeed = (RSSFeed*)[self.rssFeedsList objectAtIndex:indexPath.row];
    cell.textLabel.text = rssFeed.title;
    
    return cell;
}

#pragma mark - Table view delegate



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //[Indicator setHidden:NO];
	//[Indicator startAnimating];

    HeadingsViewController *newsHeadingTableViewController=nil;

    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        newsHeadingTableViewController = [[HeadingsViewController alloc] initWithNibName:@"HeadingsViewController" bundle:nil];
    } else {
        newsHeadingTableViewController = [[HeadingsViewController alloc] initWithNibName:@"HeadingsViewController_iPad" bundle:nil];
    }

    
    // calling the web service and populating the feeds from the news RSS feed
    RSSFeed *rssFeed = (RSSFeed*)[self.rssFeedsList objectAtIndex:indexPath.row];
    newsHeadingTableViewController.URL = rssFeed.rssLink;

    [self.navigationController pushViewController:newsHeadingTableViewController animated:YES];
    
    //[Indicator stopAnimating];
	//[Indicator setHidden:YES];

	}



@end
