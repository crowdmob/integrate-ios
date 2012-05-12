//
//  ViewController.h
//  MobDeals Sample iOS Implementation
//
//  Created by Rohen Peterson on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MobDeals.h"
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<OfferwallDelegate>
{
    MobDeals *offerwall;
}

@property (weak, nonatomic) IBOutlet UITextField *permalink;
@property (weak, nonatomic) IBOutlet UITextField *secretKey;


//When clicked, this submits the permalink, secret key, and mac address hash to verify a Loot install
- (IBAction)submitButton:(id)sender;
//When clicked, this launches a UIWebView that connects to the MobDeals UIWebView
- (IBAction)offerwallButton:(id)sender;

//Delegate method from the modal view controller's required protocol that closes the UIWebView
- (void) closeOfferwall:(BOOL) status;

@end