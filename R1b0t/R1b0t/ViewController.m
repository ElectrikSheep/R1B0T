//
//  ViewController.m
//  R1b0t
//
//  Created by L on 2014-08-25.
//  Copyright (c) 2014 ElectrikSheep. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UINavigationBarDelegate>

@property(nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property(nonatomic, strong) NSArray *assets;

@end

@implementation ViewController

@synthesize managedObjectContext;

NSInteger currentIndex = -1 ;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Go fetch the ManageObjectContext for CoreData
    managedObjectContext = [(AppDelegate *)[UIApplication sharedApplication].delegate managedObjectContext];
    
    // No Cell Selected
    currentIndex = -1 ;
    
    // Fetch all the CoreData entities
    NSFetchRequest * allItems = [[NSFetchRequest alloc] init];
    [allItems setEntity:[NSEntityDescription entityForName:@"RibotMember" inManagedObjectContext:self.managedObjectContext]];
    [allItems setIncludesPropertyValues:NO]; //only fetch the managedObjectID
    
    NSError * error = nil;
    _assets = [self.managedObjectContext executeFetchRequest:allItems error:&error];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark COLLECTION_VIEW


- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    currentIndex = indexPath.row ;
    [self performSegueWithIdentifier:@"toDetailViewController" sender:self];
 }
-(void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _assets.count ;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ELSCollectionViewCell*cell = (ELSCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"riboterViewCell" forIndexPath:indexPath];
    
    NSString*name = [self.assets[indexPath.row] firstName];
    NSString*hexC = [self.assets[indexPath.row] hexColor];
    
    UIImage*ribotar = [UIImage imageWithData: [self.assets[indexPath.row] ribotar]];
    
    [cell initCellWith:name andImage:ribotar];
    [cell alterBGColorWith:hexC];
    return cell;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 4;
}

- (CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    ELSDetailViewController *nextView = (ELSDetailViewController*) [segue destinationViewController] ;
    [nextView initViewWithDetail:self.assets[currentIndex]];
}

@end
