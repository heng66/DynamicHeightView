//
//  UIDevice+Extention.m
//  DynamicHeightView
//
//  Created by heng on 2020/11/19.
//

#import "UIDevice+Extention.h"

@implementation UIDevice (Extention)

- (BOOL)isHair {
    BOOL hasHair = NO;
    if (@available(iOS 11.0, *)) {
        UIWindow *keyWindow = UIApplication.sharedApplication.windows.firstObject;
        if (!keyWindow) {
            keyWindow = UIApplication.sharedApplication.keyWindow;
        }
        hasHair = keyWindow.safeAreaInsets.bottom > 0.0 ? YES : NO;
    }
    return  hasHair;
}

@end
