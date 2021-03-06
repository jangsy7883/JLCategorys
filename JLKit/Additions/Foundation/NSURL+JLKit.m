//
//  NSURL+JLKit.m
//  JLKit
//
//  Created by Jangsy7883 on 2015. 12. 8..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "NSURL+JLKit.h"

@implementation NSURL (JLKit)

- (nullable NSDictionary*)parameters {
    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
    
/*
    for (NSString *param in [self.query componentsSeparatedByString:@"&"]) {
        NSArray *parts = [param componentsSeparatedByString:@"="];
        if(parts.count < 2) continue;
        parameters[parts[0]] = parts[1];
    }
    return parameters;
*/
    
    NSURLComponents* urlComponents = [NSURLComponents componentsWithURL:self resolvingAgainstBaseURL:NO];
    
    for (NSURLQueryItem* queryItem in [urlComponents queryItems]) {
        if (queryItem.value != nil)
            [parameters setObject:queryItem.value forKey:queryItem.name];
    }
    
    return parameters;
}

+ (nullable instancetype)URLWithString:(nullable NSString*)baseURL parameters:(nullable NSDictionary*)parameters {
    if (baseURL != nil) {
        NSMutableArray *queryItems = [NSMutableArray array];
        for (NSString* key in parameters) {
            id value = parameters[key];
            
            if ([value respondsToSelector:@selector(stringValue)]) {
                value = [value stringValue];
            }
            else if([value isKindOfClass:[NSString class]] == NO) {
                continue;
            }
            
            [queryItems addObject:[NSURLQueryItem queryItemWithName:key value:value]];
        }
        
        NSURLComponents *components = [NSURLComponents componentsWithString:baseURL];
        components.queryItems = queryItems;
        
        return components.URL;
    }
    return nil;
}

- (BOOL)isEqualToURL:(nullable NSURL *)url {
    if ([url isKindOfClass:[NSURL class]]) {
        return [[self absoluteString] isEqualToString:[url absoluteString]];
    }
    return NO;
}

@end
