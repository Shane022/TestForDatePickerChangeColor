//
//  UIDatePicker+TPGSetTextColor.m
//  TestForChangeDatePickerTextColor
//
//  Created by dvt04 on 17/1/24.
//  Copyright © 2017年 new. All rights reserved.
//

#import "UIDatePicker+TPGSetTextColor.h"
#import <objc/runtime.h>

@implementation UIDatePicker (TPGSetTextColor)

- (void)tpg_setTextColor:(UIColor *)color
{
    unsigned int count = 0;
    objc_property_t *propertys = class_copyPropertyList([UIDatePicker class], &count);
    for (int i = 0; i < count; i ++) {
        objc_property_t property = propertys[i];
        NSString *propertyName = [NSString stringWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        NSLog(@"%@",propertyName);
        if ([propertyName isEqualToString:@"textColor"]) {
            [self setValue:color forKey:propertyName];
        }
    }
}

@end
