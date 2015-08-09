//
//  ShotInfoView.m
//  PopularOnDribbble
//
//  Created by Ryniere dos Santos Silva on 8/8/15.
//  Copyright (c) 2015 Ryniere dos Santos Silva. All rights reserved.
//

#import "ShotInfoView.h"

@implementation ShotInfoView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.6]];
        
        self.title = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 190, 40)];
        [self.title setTextColor:[UIColor whiteColor]];
        self.viewsCount = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width - 60, 0, 100, 40)];
        [self.viewsCount setTextColor:[UIColor whiteColor]];
        
        [self addSubview:self.title];
        [self addSubview:self.viewsCount];
        
        UIImageView *viewsImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"viewsIcon"]];
        CGRect iconFrame = viewsImage.frame;
        iconFrame.origin.x = self.viewsCount.frame.origin.x - iconFrame.size.width - 10;
        [viewsImage setFrame:iconFrame];
        
        [self addSubview:viewsImage];
        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
