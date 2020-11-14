//
//  DynamicCollectionView.m
//  DynamicHeightView
//
//  Created by heng on 2020/11/13.
//

#import "DynamicCollectionView.h"

@implementation DynamicCollectionView

- (void)layoutSubviews {
    [super layoutSubviews];
        
    if (!CGSizeEqualToSize(self.bounds.size, [self intrinsicContentSize])) {
        [self invalidateIntrinsicContentSize];
    }
}

- (CGSize)intrinsicContentSize {
    return self.contentSize;
}

@end
