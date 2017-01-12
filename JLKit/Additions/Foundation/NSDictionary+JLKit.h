//
//  NSDictionary+JLKit.h
//  JLKit
//
//  Created by Jangsy7883 on 2015. 10. 4..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Additions)

@property (nonatomic, readonly, copy) NSString *JSONValue;

- (id)objectOfKey:(id)key excludedNullValue:(BOOL)excludedNullValue;

- (id)objectOfFirstMatchInKeys:(NSArray*)keys;
- (id)objectOfFirstMatchInKeys:(NSArray*)keys excludedNullValue:(BOOL)excludedNullValue;

- (NSDictionary *)dictionaryByReplacingNullsWithBlanks;
    
@end

@interface NSMutableDictionary (Additions)

- (void)setSafeObject:(id)anObject forKey:(id <NSCopying>)key;

@end
