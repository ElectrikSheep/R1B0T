//
//  ELSRandomInfoView.h
//  R1b0t
//
//  Created by L on 2014-08-27.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELSRandomInfoView : UIView
@property (strong, nonatomic) IBOutlet UILabel *favSweetLabel;
@property (strong, nonatomic) IBOutlet UILabel *favSeasonLabel;

-(void) initWith:(NSString*)favSweet andSeason:(NSString*) favSeason ;

-(id) initWithXib ;

@end
