//
//  ShotDetailViewController.m
//  PopularOnDribbble
//
//  Created by Ryniere dos Santos Silva on 8/8/15.
//  Copyright (c) 2015 Ryniere dos Santos Silva. All rights reserved.
//

#import "ShotDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "ShotInfoView.h"


@interface ShotDetailViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *shotImageView;
@property (strong, nonatomic) IBOutlet UIImageView *playerAvatarImageView;
@property (strong, nonatomic) IBOutlet UILabel *playerNameLabel;
@property (strong, nonatomic) IBOutlet UITextView *shotDescriptionTextView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *shotImageViewHeightConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *shotImageWidthConstraint;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ShotDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    SDWebImageManager *manager = [SDWebImageManager sharedManager];
    [manager downloadImageWithURL: [[NSURL alloc] initWithString:self.shot.player.avatarUrl] options: 0 progress: nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (image) {
            [self.playerAvatarImageView setImage:image];
        }
    }];
        
    //Circular avatar
    self.playerAvatarImageView.layer.cornerRadius = self.playerAvatarImageView.frame.size.height /2;
    self.playerAvatarImageView.layer.masksToBounds = YES;
    self.playerAvatarImageView.layer.borderWidth = 0;
    
    // calculate the correct height of the image given the current width of the image view.
    CGFloat shotImageWidth = SCREEN_WIDTH - 20;
    [self.shotImageWidthConstraint setConstant:shotImageWidth];
    [self.shotImageViewHeightConstraint setConstant:shotImageWidth/1.333];
    
    [manager downloadImageWithURL: [[NSURL alloc] initWithString:self.shot.imageUrl] options: 0 progress: nil completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (image) {
            [self.shotImageView setImage:image];
        }
    }];
    
    self.playerNameLabel.text = self.shot.player.name;
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithData:[self.shot.shotDescription dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType } documentAttributes:nil error:nil];

    
    self.shotDescriptionTextView.attributedText = attributedString;
    [[self.shotDescriptionTextView layoutManager] usedRectForTextContainer:self.shotDescriptionTextView.textContainer];
    
    [self.scrollView setContentSize:CGSizeMake(SCREEN_WIDTH, self.shotDescriptionTextView.frame.origin.y + self.shotDescriptionTextView.frame.size.height)];
};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
