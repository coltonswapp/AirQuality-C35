//
//  CBSAirQualityController.m
//  AirQualityC35
//
//  Created by Colton Swapp on 8/12/20.
//  Copyright © 2020 Colton Swapp. All rights reserved.
//

#import "CBSAirQualityController.h"
#import "CBSCityAirQuality.h"

static NSString * const baseURLString = @"https://api.airvisual.com/";
static NSString * const versionComponent = @"v2";
static NSString * const countryComponent = @"countries";
static NSString * const stateComponent = @"states";
static NSString * const cityComponent = @"cities";
static NSString * const cityDetailsComponent = @"city";
static NSString * const apiKeyKey = @"key";
static NSString * const apiKey = @"97599204-5f04-4009-acf7-b342ef9af90a";

@implementation CBSAirQualityController

+ (void)fetchSupportedCountries:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL * baseURL = [NSURL URLWithString:baseURLString];
    NSURL * versionURL = [baseURL URLByAppendingPathComponent:versionComponent];
    NSURL * countryURL = [versionURL URLByAppendingPathComponent:countryComponent];
    
    NSMutableArray<NSURLQueryItem *> * queryItemsArray = [NSMutableArray new];
    NSURLQueryItem * apiKeyQueryItem = [NSURLQueryItem queryItemWithName:apiKeyKey value:apiKey];
    
    [queryItemsArray addObject:apiKeyQueryItem];
    NSURLComponents * componentsURL = [[NSURLComponents alloc] initWithURL:countryURL resolvingAgainstBaseURL:true];
    
    [componentsURL setQueryItems:queryItemsArray];
    
    NSURL * finalURL = [componentsURL URL];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil); return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (!data)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil); return;
        }
        
        NSDictionary * topLevel = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSDictionary * dataDictionary = topLevel[@"data"];
        NSMutableArray * countriesArray = [NSMutableArray new];
        
        for (NSDictionary * countryDictionary in dataDictionary)
        {
            NSString * country = [[NSString alloc] initWithString:countryDictionary[@"country"]];
            [countriesArray addObject:country];
        }
        completion(countriesArray);
        
        
    }] resume];
    
    
    
}

+ (void)fetchSupportedStatesInCountry:(NSString *)country completion:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL * baseURL = [NSURL URLWithString:baseURLString];
    NSURL * versionURL = [baseURL URLByAppendingPathComponent:versionComponent];
    NSURL * statesURL = [versionURL URLByAppendingPathComponent:stateComponent];
    
    NSMutableArray<NSURLQueryItem *> * queryItemsArray = [NSMutableArray new];
    
    NSURLQueryItem * countryQuery = [[NSURLQueryItem alloc] initWithName:@"country" value:country];
    NSURLQueryItem * apiKeyQueryItem = [NSURLQueryItem queryItemWithName:apiKeyKey value:apiKey];
    
    [queryItemsArray addObject:countryQuery];
    [queryItemsArray addObject:apiKeyQueryItem];
    
    NSURLComponents * urlComponents = [[NSURLComponents alloc] initWithURL:statesURL resolvingAgainstBaseURL:true];
    [urlComponents setQueryItems:queryItemsArray];
    
    NSURL * finalURL = [urlComponents URL];
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil); return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (!data)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil); return;
        }
        
        NSDictionary * topLevel = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSDictionary * dataDictionary = topLevel[@"data"];
        NSMutableArray * statesArray = [NSMutableArray new];
        
        for (NSDictionary * stateDictionary in dataDictionary)
        {
            NSString * state = [[NSString alloc] initWithString:stateDictionary[@"state"]];
            [statesArray addObject:state];
        }
        completion(statesArray);
        
        
            
    }] resume];
}

+ (void)fetchSupportedCitiesInState:(NSString *)state country:(NSString *)country completion:(void (^)(NSArray<NSString *> * _Nullable))completion
{
    NSURL * baseURL = [NSURL URLWithString:baseURLString];
    NSURL * versionURL = [baseURL URLByAppendingPathComponent:versionComponent];
    NSURL * cityURL = [versionURL URLByAppendingPathComponent:cityComponent];
    
    NSMutableArray<NSURLQueryItem *> * queryItemsArray = [NSMutableArray new];

    NSURLQueryItem * apiKeyQueryItem = [NSURLQueryItem queryItemWithName:apiKeyKey value:apiKey];
    NSURLQueryItem * stateQuery = [NSURLQueryItem queryItemWithName:@"state" value:state];
    NSURLQueryItem * countryQuery = [[NSURLQueryItem alloc] initWithName:@"country" value:country];
    
    [queryItemsArray addObject:stateQuery];
    [queryItemsArray addObject:countryQuery];
    [queryItemsArray addObject:apiKeyQueryItem];
    
    NSURLComponents * urlComponents = [[NSURLComponents alloc] initWithURL:cityURL resolvingAgainstBaseURL:true];
    [urlComponents setQueryItems:queryItemsArray];
    
    NSURL * finalURL = [urlComponents URL];
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil); return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (!data)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil); return;
        }
        
        NSDictionary * topLevel = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSDictionary * dataDictionary = topLevel[@"data"];
        NSMutableArray * citiesArray = [NSMutableArray new];
        
        for (NSDictionary * cityDictionary in dataDictionary)
        {
            NSString * city = [[NSString alloc] initWithString:cityDictionary[@"city"]];
            [citiesArray addObject:city];
        }
        completion(citiesArray);
        
    }] resume];
    
}

+ (void)fetchDataforCity:(NSString *)city state:(NSString *)state country:(NSString *)country completion:(void (^)(CBSCityAirQuality * _Nullable))completion
{
    NSURL * baseURL = [NSURL URLWithString:baseURLString];
    NSURL * versionURL = [baseURL URLByAppendingPathComponent:versionComponent];
    NSURL * cityURL = [versionURL URLByAppendingPathComponent:cityDetailsComponent];
    
    NSMutableArray<NSURLQueryItem *> * queryItemsArray = [NSMutableArray new];

    NSURLQueryItem * apiKeyQueryItem = [NSURLQueryItem queryItemWithName:apiKeyKey value:apiKey];
    NSURLQueryItem * stateQuery = [NSURLQueryItem queryItemWithName:@"state" value:state];
    NSURLQueryItem * countryQuery = [[NSURLQueryItem alloc] initWithName:@"country" value:country];
    NSURLQueryItem * cityQuery = [NSURLQueryItem queryItemWithName:@"city" value:city];
    
    [queryItemsArray addObject:cityQuery];
    [queryItemsArray addObject:stateQuery];
    [queryItemsArray addObject:countryQuery];
    [queryItemsArray addObject:apiKeyQueryItem];
    
    NSURLComponents * urlComponents = [[NSURLComponents alloc] initWithURL:cityURL resolvingAgainstBaseURL:true];
    [urlComponents setQueryItems:queryItemsArray];
    
    NSURL * finalURL = [urlComponents URL];
    NSLog(@"%@", finalURL);
    
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil); return;
        }
        
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        if (!data)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil); return;
        }
        
        NSDictionary * topLevel = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSDictionary * dataDictionary = topLevel[@"data"];
        
        CBSCityAirQuality * cityAQI = [[CBSCityAirQuality alloc] initWithDictionary:dataDictionary];
        completion(cityAQI);
        
    }] resume];
}


@end
