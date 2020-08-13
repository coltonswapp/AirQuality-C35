//
//  CBSCityAirQuality.h
//  AirQualityC35
//
//  Created by Colton Swapp on 8/12/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CBSPollution;
@class CBSWeather;

NS_ASSUME_NONNULL_BEGIN

@interface CBSCityAirQuality : NSObject

@property (nonatomic, copy, readonly)NSString * city;
@property (nonatomic, copy, readonly)NSString * state;
@property (nonatomic, copy, readonly)NSString * country;
@property (nonatomic, copy, readonly)CBSWeather * weather;
@property (nonatomic, copy, readonly)CBSPollution * pollution;

-(instancetype)initWithCityName:(NSString *)city
                          state:(NSString *)state
                        country:(NSString *)country
                        weather:(CBSWeather *) weather
                      pollution:(CBSPollution *)pollution;

@end

@interface CBSCityAirQuality (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *,id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
