//
//  BYCollectionViewCell.m
//  testWaterCollectionView
//
//  Created by yao on 14-4-24.
//  Copyright (c) 2014年 weimi. All rights reserved.
//

#import "BYCollectionViewCell.h"

@implementation BYCollectionViewCell

-(void)prepareForReuse
{
    NSLog(@"--prepareForReuse---");
}

- (void)dealloc
{
    NSLog(@"----dealloc----");
}

@end
