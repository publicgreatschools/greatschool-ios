//
//  UIView+Appearance.h
//  FeedFwd
//
//  Created by Victor Zhu on 9/30/15.
//  Copyright © 2015 FeedFwd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Appearance)

+ (instancetype)appearanceWhenContainedInInstancesOfClass:(Class<UIAppearanceContainer>)containerClass;

@end