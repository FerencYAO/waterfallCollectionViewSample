//
//  RootVc.m
//  testWaterCollectionView
//
//  Created by yao on 14-4-24.
//  Copyright (c) 2014年 weimi. All rights reserved.
//

#import "RootVc.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "BYCollectionViewCell.h"

static NSString *cellIdentifier = @"BYCollectionViewCell";

@interface RootVc () <PSTCollectionViewDataSource,PSTCollectionViewDelegate,CHTCollectionViewDelegateWaterfallLayout>

@property (strong, nonatomic) PSUICollectionView *collectionView;


@end

@implementation RootVc

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if (version < 7.0) {
        layout.sectionInset =  UIEdgeInsetsMake(10, 10, 120, 10);
    }else {
        layout.sectionInset =  UIEdgeInsetsMake(10, 10, 100, 10);
    }
    
    self.collectionView = [[PSUICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds)) collectionViewLayout:layout];
    
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[BYCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
}

- (NSInteger)collectionView:(PSUICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (PSUICollectionViewCell *)collectionView:(PSUICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return (PSUICollectionViewCell *)cell;
}

- (CGSize)collectionView:(PSTCollectionView *)collectionView layout:(PSTCollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    int height = arc4random() % 500;
    return CGSizeMake(120, (float)height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
