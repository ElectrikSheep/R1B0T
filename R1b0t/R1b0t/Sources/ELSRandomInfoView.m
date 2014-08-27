//
//  ELSRandomInfoView.m
//  R1b0t
//
//  Created by L on 2014-08-27.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import "ELSRandomInfoView.h"

@implementation ELSRandomInfoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(void) initWith:(NSString*)favSweet andSeason:(NSString*) favSeason {
    self.favSeasonLabel.text = favSeason == nil ? @"Nope" : favSeason ;
    self.favSweetLabel.text = favSweet == nil ? @"More of a salty person" : favSweet ;
}

-(id) initWithXib {
    self = [super init];
    NSArray *subviewArray = [[NSBundle mainBundle] loadNibNamed:@"randomInfoView" owner:self options:nil];
    return [subviewArray objectAtIndex:0];
}


@end
