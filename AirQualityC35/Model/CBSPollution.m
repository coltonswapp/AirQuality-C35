//
//  CBSPollution.m
//  AirQualityC35
//
//  Created by Colton Swapp on 8/12/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import "CBSPollution.h"

@implementation CBSPollution

- (instancetype)initWithAQI:(NSInteger)airQualityIndex
{
    self = [super init];
    if (self)
    {
        _airQualityIndex = airQualityIndex;
    }
    return self;
}

@end

@implementation CBSPollution (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSInteger airQualityIndex = [dictionary[@"aqius"] intValue];
    
    return [self initWithAQI:airQualityIndex];
}

@end
