//
//  CBSPollution.h
//  AirQualityC35
//
//  Created by Colton Swapp on 8/12/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CBSPollution : NSObject

@property (nonatomic, readonly)NSInteger airQualityIndex;

- (instancetype)initWithAQI:(NSInteger)airQualityIndex;

@end

@interface CBSPollution (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary<NSString *, id> *)dictionary;

@end

NS_ASSUME_NONNULL_END
