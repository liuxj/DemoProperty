//
//  LXJAppliance.m
//  DemoProperty
//
//  Created by liuxj on 15/11/24.
//  Copyright © 2015年 LXJ. All rights reserved.
//

#import "LXJAppliance.h"

@interface LXJAppliance()
{
    NSString *_name;
}
@end

@implementation LXJAppliance

- (NSString *)name
{
    return _name;
}

- (void)update
{
    self.name = @"ccc";
}

@end
