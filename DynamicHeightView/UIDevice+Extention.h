//
//  UIDevice+Extention.h
//  DynamicHeightView
//
//  Created by heng on 2020/11/19.
//

#import <UIKit/UIKit.h>

#define SAFE_HEIGHT ([[UIDevice currentDevice] isHair] ? 88.0:64.0)

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Extention)

- (BOOL)isHair;

@end

NS_ASSUME_NONNULL_END
