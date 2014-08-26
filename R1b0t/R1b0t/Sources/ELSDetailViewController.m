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
    
    
    // Adding the SubViews to the scroll view
    ELSdescriptionView *descriptionView = [[ELSdescriptionView alloc] initWithXib];
    [descriptionView initWith:@"Random" andDescription:@"More random stuff" ];
    [self.scrollView addSubview:descriptionView];

    
    CGFloat xOrigin = 1 * self.scrollView.frame.size.width;
    ELSMapView *mapView = [[ELSMapView alloc] initWithXib] ;
    CGRect tempFrame = CGRectMake(xOrigin, 0, 320, 280) ;
    [mapView setFrame:tempFrame];
    
    [self.scrollView addSubview:mapView];
    self.scrollView.pagingEnabled = YES ;
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 2, self.scrollView.frame.size.height);
    
    [self initDataFromRiboter:self.ribotInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) initDataFromRiboter:(RibotMember*) member {
    self.firstNameLabel.text = member.firstName ;
    self.lastNameLabel.text = member.lastName ;
    self.nicknameLabel.text = member.nickName;
    
    self.ribotar.image = [UIImage imageWithData:member.ribotar];
    
    }

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/






-(UIColor *) colorWithHexString: (NSString *) hexString {
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            break;
        default:
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            break;
    }
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
}

-(CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}



@end