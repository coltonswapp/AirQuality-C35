//
//  CBSAirQualityController.h
//  AirQualityC35
//
//  Created by Colton Swapp on 8/12/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CBSCityAirQuality;

NS_ASSUME_NONNULL_BEGIN

@interface CBSAirQualityController : NSObject


+(void)fetchSupportedCountries:(void (^) (NSArray<NSString *> * _Nullable))completion;

+(void)fetchSupportedStatesInCountry:(NSString *)country
                          completion:(void (^) (NSArray<NSString *> * _Nullable))completion;

+(void)fetchSupportedCitiesInState:(NSString *)state
                           country:(NSString *)country
                        completion:(void (^) (NSArray<NSString *> * _Nullable))completion;

+(void)fetchDataforCity:(NSString *)city
                  state:(NSString *)state
                country:(NSString *)country
             completion:(void (^) (CBSCityAirQuality * _Nullable))completion;

@end

NS_ASSUME_NONNULL_END
