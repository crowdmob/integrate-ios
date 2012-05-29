//
//  ViewController.h
//  MobDeals Sample iOS Implementation
//
//  Created by Rohen Peterson on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CrowdMob.h"
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<CrowdMobDelegate, UITextFieldDelegate>
{
    CrowdMob *offerwall;
}

@property (weak, nonatomic) IBOutlet UITextField *permalink;
@property (weak, nonatomic) IBOutlet UITextField *secretKey;


//When clicked, this submits the permalink, secret key, and mac address hash to verify a Loot install
- (IBAction)submitButton:(id)sender;
//When clicked, this launches a UIWebView that connects to the MobDeals UIWebView
- (IBAction)offerwallButton:(id)sender;

//Delegate method from the modal view controller's required protocol that closes the UIWebView
- (void) closeOfferwall:(BOOL) status;
//Delegate method that runs when a MobDeals transaction succeeds or fails, along with transaction information on success
- (void) transactionStatus:(BOOL) status;
//Delegate method that runs when a verification succeeds or fails
- (void) verificationStatus:(BOOL) status verificationStatusCode:(NSInteger) statusCode;
//Delegate for the text field to resign the keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField;

@end
