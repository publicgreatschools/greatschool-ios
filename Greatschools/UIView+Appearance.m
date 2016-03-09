//
//  UIView+Appearance.m
//  FeedFwd
//
//  Created by Victor Zhu on 9/30/15.
//  Copyright © 2015 FeedFwd. All rights reserved.
//

#import "UIView+Appearance.h"

@implementation UIView (Appearance)

+ (instancetype)appearanceWhenContainedInInstancesOfClass:(Class<UIAppearanceContainer>)containerClass {
	return [self appearanceWhenContainedIn:containerClass, nil];
}

@end