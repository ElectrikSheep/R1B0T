//
//  ELSdescriptionView.h
//  R1b0t
//
//  Created by L on 2014-08-26.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ELSdescriptionView : UIView
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (strong, nonatomic) IBOutlet UILabel *roleLabel;

-(void) initWith:(NSString*)role andDescription:(NSString*) description  ;

-(id) initWithXib ;

@end
