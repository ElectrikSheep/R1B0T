//
//  ELSCollectionViewCell.h
//  R1b0t
//
//  Created by L on 2014-08-26.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ELSCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *riboterRibotar;
@property (strong, nonatomic) IBOutlet UILabel *riboterName;

-(void) initCellWith:(NSString*)name andImage:(UIImage*)ribotar ;
-(void) alterBGColorWith:(NSString*) color ;

@end
