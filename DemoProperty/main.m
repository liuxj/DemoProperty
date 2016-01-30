//
//  main.m
//  DemoProperty
//
//  Created by liuxj on 15/11/24.
//  Copyright © 2015年 LXJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LXJAppliance.h"
#import "LXJProperty.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");

        LXJAppliance *appliance1 = [[LXJAppliance alloc] init];
        appliance1.name = @"aaa";
        NSString *name = appliance1.name;
        NSLog(@"===> %@, %@", appliance1.name, name);
        [appliance1 update];
        NSLog(@"===> %@, %@", appliance1.name, name);
        NSLog(@"===> %p, %p", appliance1.name, name);

        //
        NSLog(@"-------------------------------------------------");
        LXJProperty *property = [LXJProperty new];
        [property test];
    }
    return 0;
}
