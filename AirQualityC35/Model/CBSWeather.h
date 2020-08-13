//
//  CBSWeather.h
//  AirQualityC35
//
//  Created by Colton Swapp on 8/12/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CBSWeather : NSObject

@property (nonatomic, readonly)NSInteger temperature;
@property (nonatomic, readonly)NSInteger humidity;
@property (nonatomic, readonly)NSInteger windspeed;

-(instancetype)initWithWeatherTemperature:(NSInteger)temperature
                                 humidity:(NSInteger)humidity
                                windspeed:(NSInteger)windspeed;


@end

@interface CBSWeather (JSONConvertable)

-(instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
