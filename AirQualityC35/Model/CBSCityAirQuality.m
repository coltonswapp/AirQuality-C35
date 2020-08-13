//
//  CBSCityAirQuality.m
//  AirQualityC35
//
//  Created by Colton Swapp on 8/12/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import "CBSCityAirQuality.h"
#import "CBSWeather.h"
#import "CBSPollution.h"

@implementation CBSCityAirQuality

- (instancetype)initWithCityName:(NSString *)city state:(NSString *)state country:(NSString *)country weather:(CBSWeather *)weather pollution:(CBSPollution *)pollution
{
    self = [super init];
    if (self)
    {
        _city = city;
        _state = state;
        _country = country;
        _weather = weather;
        _pollution = pollution;
    }
    return self;
}

@end

@implementation CBSCityAirQuality (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary
{
    NSString * city = dictionary[@"city"];
    NSString * state = dictionary[@"state"];
    NSString * country = dictionary[@"country"];
    NSDictionary * currentInfo = dictionary[@"current"];
    CBSWeather * weather = [[CBSWeather alloc] initWithDictionary:currentInfo[@"weather"]];
    CBSPollution * pollution = [[CBSPollution alloc] initWithDictionary:currentInfo[@"pollution"]];
    
    return [self initWithCityName:city state:state country:country weather:weather pollution:pollution];
}

@end
