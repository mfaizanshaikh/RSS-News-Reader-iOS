//
//  RSSDetailWebViewController.h
//  CurrentNews
//
//  Created by Faizan on 7/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RSSDetailWebViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic, retain) NSString *rssUrl;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *Indicator;

@end
