//
//  ELSDetailViewController.h
//  R1b0t
//
//  Created by L on 2014-08-26.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import <UIKit/UIKit.h>

// Access the Ribot Entity
#import "RibotMember.h"

// For the secondary views and populate them
#import "ELSdescriptionView.h"
#import "ELSMapView.h"

// To import the color from HEX string ;
#import "UIColor+ColorConverter.h"

#import <MessageUI/MFMailComposeViewController.h>

@interface ELSDetailViewController : UIViewController <MFMailComposeViewControllerDelegate>

@property(strong , nonatomic) RibotMember* ribotInfo ;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *ribotar;
@property (strong, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *nicknameLabel;

@property (strong, nonatomic) IBOutlet UIButton *btnTwitter;
@property (strong, nonatomic) IBOutlet UIButton *btnEmail;


-(void) initViewWithDetail:(RibotMember*) teammate ;

@end
