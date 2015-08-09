//
//  ViewController.m
//  PopularOnDribbble
//
//  Created by Ryniere dos Santos Silva on 8/5/15.
//  Copyright (c) 2015 Ryniere dos Santos Silva. All rights reserved.
//

#import "ViewController.h"
#import "ApiClient.h"
#import "ShotListModel.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ShotCollectionViewCell.h"
#import "ShotDetailViewController.h"
#import "ShotInfoView.h"
#import "ADLivelyCollectionView.h"

@interface ViewController ()<UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource>

@property (strong, nonatomic) IBOutlet ADLivelyCollectionView *collectionView;
@property (strong, nonatomic) UIRefreshControl *refreshControl;
@property (strong, nonatomic) ShotListModel *shotList;
@property (nonatomic, strong) NSMutableArray * shots;
@property (nonatomic) BOOL loadingMoreItens;

@end

@implementation ViewController

NSIndexPath *selectedIndexPath;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.shots = [[NSMutableArray alloc] init];
    self.loadingMoreItens = false;
    [self.collectionView registerNib:[UINib nibWithNibName:@"ShotCollectionViewCell"
                                                    bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
    
    [self.collectionView setInitialCellTransformBlock:ADLivelyTransformFlip];
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(reloadData) forControlEvents:UIControlEventValueChanged];
    [self.collectionView addSubview:self.refreshControl];
    
    [self reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Data methods

- (void)reloadData {
    [[ApiClient sharedManager] getPopularShotsFromPage:@"1" success:^(ShotListModel *shotList) {
        
        [self.shots removeAllObjects];
        self.shotList = shotList;
        [self.shots addObjectsFromArray:shotList.shots];
        [self.collectionView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
    [self.refreshControl endRefreshing];
}

- (void)fetchMoreItens{
    
    NSString *nextPage = [NSString stringWithFormat:@"%d", [self.shotList.page intValue] + 1];
    [[ApiClient sharedManager] getPopularShotsFromPage:nextPage success:^(ShotListModel *shotList) {
        
        self.shotList = shotList;
        NSInteger count = [self.shots count];
        [self.shots addObjectsFromArray:self.shotList.shots];
        NSInteger newCount = [self.shots count];
        NSMutableArray *indexPaths = [[NSMutableArray alloc] init];
        
        for (NSInteger i = count; i < newCount; i++) {
            [indexPaths addObject:[NSIndexPath indexPathForItem:count++ inSection:0]];
        }

        [self.collectionView performBatchUpdates:^{
            
            [self.collectionView insertItemsAtIndexPaths:indexPaths];
            
        } completion:^(BOOL finished) {
            self.loadingMoreItens = false;
        }];
        
    } failure:^(NSError *error) {
        self.loadingMoreItens = false;
    }];
}


#pragma mark - CollectionView Data Source

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.shots count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ShotCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    ShotModel *shot = self.shots[indexPath.item];
    
    
    [cell.imageHeightConstraint setConstant:cell.frame.size.height];
    [cell.imageWidthConstraint setConstant:cell.frame.size.width];
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL: [[NSURL alloc] initWithString:shot.imageUrl] options: 0 progress: nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (image) {
            [cell.backgroundImage setImage:image];
        }
    }];
    
    if (cell.infoView == nil) {
        
         cell.infoView = [[ShotInfoView alloc] initWithFrame:CGRectMake(0, cell.frame.size.height - 40, cell.frame.size.width, 40)];
        [cell addSubview:cell.infoView];
    }
   
    cell.infoView.title.text = shot.title;
    cell.infoView.viewsCount.text = [NSString stringWithFormat:@"%d", [shot viewsCount]];
    
        
    if (indexPath.item == self.shots.count - 5 && self.shotList.pages != [self.shotList.page integerValue] && !self.loadingMoreItens) {
        self.loadingMoreItens = true;
        [self fetchMoreItens];
    }
    
    
    return cell;
}

#pragma mark - CollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    selectedIndexPath = indexPath;
    
    [self performSegueWithIdentifier:@"showDetail" sender:self];
    
}

#pragma mark - CollectionView Flow Layout Delegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (IS_IPAD()) {
        return CGSizeMake(SCREEN_WIDTH/2, SCREEN_WIDTH/2/1.333);
    }
    return CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH/1.333);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    
    return 15;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    return 0;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        ShotModel *shot = self.shots[selectedIndexPath.item];
        [[segue destinationViewController] setShot:shot];
    }
}

@end
