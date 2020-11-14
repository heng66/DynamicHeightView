//
//  DynamicView.h
//  DynamicHeightView
//
//  Created by heng on 2020/11/13.
//

#import <UIKit/UIKit.h>
#import "DynamicCollectionView.h"

NS_ASSUME_NONNULL_BEGIN

@interface DynamicView : UIView

@property (nonatomic, strong) DynamicCollectionView *collectionView;
@property (nonatomic, strong) NSArray *dataArr;

@end

NS_ASSUME_NONNULL_END
