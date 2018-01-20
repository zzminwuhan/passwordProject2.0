//
//  HTMainAccountsModel.m
//  XuanYuan
//
//  Created by niesiyang-worker on 2018/1/20.
//  Copyright © 2018年 聂嗣洋. All rights reserved.
//

#import "HTMainAccountsModel.h"
#import "YYText.h"

@implementation HTMainAccountsSubModel
+ (NSArray *)requiredProperties {
    return @[@"subTitle"];
}
+ (NSDictionary *)linkingObjectsProperties {
    return @{
             @"owners": [RLMPropertyDescriptor descriptorWithClass:HTMainAccountsModel.class propertyName:@"infoPassWord"],
             };
}
@end

@implementation HTMainAccountsModel
+ (NSArray *)requiredProperties {
    return @[@"accountTitle",@"k_id"];
}
//设置属性默认值
+ (NSDictionary *)defaultPropertyValues{
    return @{@"isCollect":@(NO),
             @"iconType":@(0)
             };
}
@end

@implementation HTMainAccountsKindModel
+ (NSArray *)requiredProperties {
    return @[@"kindName"];
}
@end
