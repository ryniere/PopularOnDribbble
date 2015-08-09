//
//  ShotCollectionViewCell.h
//  PopularOnDribbble
//
//  Created by Ryniere dos Santos Silva on 8/6/15.
//  Copyright (c) 2015 Ryniere dos Santos Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShotInfoView.h"

@interface ShotCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) ShotInfoView *infoView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageWidthConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *imageHeightConstraint;

@end
