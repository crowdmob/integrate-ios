//
//  ViewController.m
//  MobDeals Sample iOS Implementation
//
//  Created by Rohen Peterson on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <CommonCrypto/CommonDigest.h>
#import "ViewController.h"
#import "MobDeals.h"

@implementation ViewController

@synthesize secretKey;
@synthesize permalink;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
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
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

//When clicked, this submits the permalink, secret key, and mac address hash to verify a Loot install
- (IBAction)submitButton:(id)sender
{
    //Initialize Loot within the MobDeals package
    MobDeals *loot = [[MobDeals alloc] init];
    
    //Set the secret key
    loot.secretKey = [secretKey text];
    
    //Set the permalink
    loot.permalink = [permalink text];
    
    //Verify the install with Loot
    [loot verifyInstall];
    
}

//When clicked, this launches a UIWebView that connects to the MobDeals UIWebView
- (IBAction)offerwallButton:(id)sender
{
    //Display a modal view which includes a UIWebView to handle the purchase
    offerwall = [[UIStoryboard storyboardWithName:@"MobDeals" bundle:nil] instantiateInitialViewController];
    
    //Set the secret key
    offerwall.secretKey = [secretKey text];
    
    //Set the permalink
    offerwall.permalink = [permalink text];
    
    //Set the environment
    offerwall.environment = @"STAGING";
    
    //Set this controller as the delegate for the modal view controller
    offerwall.delegate = self;
    
    //Launch the modal view controller, which includes the UIWebView
    [self presentModalViewController:offerwall animated:YES];
}

//Delegate method from the modal view controller's required protocol that closes the UIWebView
- (void) closeOfferwall:(BOOL) status
{
    if (status) {
        //Dismiss the modal view
        [self dismissModalViewControllerAnimated:YES];
        
        //Take care of the leftover modal view elements
        offerwall.webView = nil;
        offerwall = nil;
        
        //Clear the cache - not recommended for production application use
        [[NSURLCache sharedURLCache] removeAllCachedResponses];
    }
}

@end
