//
//  ELSDetailViewController.m
//  R1b0t
//
//  Created by L on 2014-08-26.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import "ELSDetailViewController.h"

@interface ELSDetailViewController ()

@end

@implementation ELSDetailViewController

-(void) initViewWithDetail:(RibotMember *)teammate {
    self.ribotInfo = teammate ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initDataFromRiboter:self.ribotInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



// Setup the component of the ELSDetailView
-(void) initDataFromRiboter:(RibotMember*) member {
    // Set the difference labels
    self.firstNameLabel.text = member.firstName ;
    self.lastNameLabel.text = member.lastName ;
    self.nicknameLabel.text = member.nickName;
    
    // Set the Ribotar
    self.ribotar.image = [UIImage imageWithData:member.ribotar];
    
    // Check if we need to display the social buttons
    if( self.ribotInfo.twitter == nil )
        self.btnTwitter.enabled = NO ;
    if( self.ribotInfo.email == nil )
        self.btnEmail.enabled = NO ;
    
    
    // Set the background color for the Riboter
    if( self.ribotInfo.hexColor != nil ){
        self.view.backgroundColor =  [UIColor colorWithHexString:self.ribotInfo.hexColor ];
    }
    else  self.view.backgroundColor = [UIColor grayColor];
    
    
    // Setting the SubViews to the scroll view
    ELSdescriptionView *descriptionView = [[ELSdescriptionView alloc] initWithXib];
    [descriptionView initWith:self.ribotInfo.role
               andDescription:self.ribotInfo.rDescription ];
    [self.scrollView addSubview:descriptionView];
    
    
    CGFloat xOrigin = 1 * self.scrollView.frame.size.width;
    ELSMapView *mapView = [[ELSMapView alloc] initWithXib] ;
    CGRect tempFrame = CGRectMake(xOrigin, 0, 320, 280) ;
    [mapView setFrame:tempFrame];
    
    [self.scrollView addSubview:mapView];
    self.scrollView.pagingEnabled = YES ;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 2, self.scrollView.frame.size.height);

    
    }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark BTN_ACTIONS

// Will trigger a NAtive iOS Mail composer to send an email to the selected Riboter
- (IBAction)actionMailComposer:(id)sender {
    MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
    controller.mailComposeDelegate = self;
    [controller setSubject:@"DO NOT PRESS SEND"];
    NSLog(@"%@", self.ribotInfo.email) ;
    NSArray *toRecipents = [NSArray arrayWithObject:self.ribotInfo.email] ;
    [controller setToRecipients:toRecipents] ;
    [controller setMessageBody:@"" isHTML:NO];
    if (controller)
        [self presentViewController:controller animated:YES completion:nil];
}


// Delegate for the MailComposer
- (void)mailComposeController:(MFMailComposeViewController*)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError*)error;
{
    if( result != MFMailComposeResultSent || result!= MFMailComposeResultSaved ){
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}


// Uses either Safari or the twitter App
// to View the selecter riboter Twitter feed
// Need to double check if this matches iOS guideline or not
- (IBAction)actionTwitterViewer:(id)sender {
    
    // Check if twitter app is installed on the device
    NSString*query = [NSString stringWithFormat:@"twitter://user?screen_name=%@", self.ribotInfo.twitter] ;
    if( [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:query]] ){
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:query]];
    }
    // Otherwise use Safari
    else {
        query = [NSString stringWithFormat:@"https://twitter.com/%@", self.ribotInfo.twitter] ;
        if (![[UIApplication sharedApplication] openURL:[NSURL URLWithString:query]]) {
            NSLog(@"%@%@",@"Failed to open url:",query);
        }
    }
}




@end
