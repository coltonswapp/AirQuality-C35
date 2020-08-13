//
//  CBSWeather.m
//  AirQualityC35
//
//  Created by Colton Swapp on 8/12/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import "CBSWeather.h"

@implementation CBSWeather

- (instancetype)initWithWeatherTemperature:(NSInteger)temperature humidity:(NSInteger)humidity windspeed:(NSInteger)windspeed
{
    self = [super init] ;
    if (self)
    {
        _temperature = temperature;
        _humidity = humidity;
        _windspeed = windspeed;
    }
    return self;
}

@end

@implementation CBSWeather (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSInteger temperature = [dictionary[@"tp"] intValue];
    NSInteger humidity = [dictionary[@"hu"] intValue];
    NSInteger windspeed = [dictionary[@"ws"] intValue];
    
    return [self initWithWeatherTemperature:temperature humidity:humidity windspeed:windspeed];
}

@end
