//
//  ELSdescriptionView.m
//  R1b0t
//
//  Created by L on 2014-08-26.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import "ELSdescriptionView.h"

@implementation ELSdescriptionView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id) initWithXib {
    self = [super init];
        
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"descriptionView" owner:self options:nil];
    return [subviewArray objectAtIndex:0];
    
    return self;
}


-(void) initWith:(NSString*)role andDescription:(NSString*) description {
    self.descriptionLabel.text = description ;
    self.roleLabel.text = role ;
    
    NSLog(@"This is done") ;
}

@end
