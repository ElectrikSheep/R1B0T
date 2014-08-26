//
//  ELSDetailViewController.h
//  R1b0t
//
//  Created by L on 2014-08-26.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RibotMember.h"

#import "ELSdescriptionView.h"
#import "ELSMapView.h"

@interface ELSDetailViewController : UIViewController

@property(strong , nonatomic) RibotMember* ribotInfo ;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *ribotar;
@property (strong, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *nicknameLabel;



-(void) initViewWithDetail:(RibotMember*) teammate ;

@end
