//
//  RSSDetailWebViewController.m
//  CurrentNews
//
//  Created by Faizan on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RSSDetailWebViewController.h"

@implementation RSSDetailWebViewController
@synthesize webView;
@synthesize rssUrl=_rssUrl;
@synthesize Indicator;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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
    self.title = @"News in Detail";

 //   NSString *urlAddress = @”http://www.google.com”;
    
    //Create a URL object.
    [Indicator setHidden:YES];

    NSURL *url = [NSURL URLWithString:self.rssUrl];
    
    //URL Requst Object
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    
    [webView loadRequest:requestObj];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setWebView:nil];
    [self setIndicator:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark webView Delgate
- (void)webViewDidStartLoad:(UIWebView *)webView{
	[Indicator setHidden:NO];
	[Indicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
	[Indicator stopAnimating];
	[Indicator setHidden:YES];
}


@end
