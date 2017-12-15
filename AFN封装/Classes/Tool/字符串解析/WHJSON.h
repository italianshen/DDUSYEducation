//
//  WHJSON.h
//  车信帮
//
//  Created by 王印 on 15/9/18.
//  Copyright © 2015年 王印. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WHJSON : NSObject

+ (id)objectFormJsonData:(NSData *)jsondata;
+ (id)objectFormJsonString:(NSString *)json;
+ (NSString *)jsonStringWithObject:(id)object;

@end

@interface NSObject (Json)

- (NSString *)jsonString;

@end

@interface NSString (ObjectForJson)

- (id)objectFormJsonString;

@end
