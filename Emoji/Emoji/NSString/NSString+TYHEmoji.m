//
//  NSString+TYHEmoji.m
//  NSStringEmojize
//
//  Created by Vieene on 16/6/23.
//  Copyright © 2016年 DIY. All rights reserved.
//

#import "NSString+TYHEmoji.h"
#import "TYHEmojiDic.h"
static NSDictionary * s_unicodeToCheatCodes = nil;
static NSDictionary * s_cheatCodesToUnicode = nil;

@implementation NSString (TYHEmoji)
//&#x1f602 ----->\U0001F604  
- (NSString *)stringByReplacingEmojiCheatCodesToUnicode
{
    if (!s_cheatCodesToUnicode) {
        [NSString initializeEmojiCheatCodes];
    }
    
    if (self.length) {
        __block NSMutableString *newText = [NSMutableString stringWithString:self];
        [s_cheatCodesToUnicode enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSString *string = ([obj isKindOfClass:[NSArray class]] ? [obj firstObject] : obj);
            
            [newText replaceOccurrencesOfString:key withString:string options:NSLiteralSearch range:NSMakeRange(0, newText.length)];
        }];
        return newText;
    }
    return self;
}

//\U0001F604  -----> &#x1F602
- (NSString *)stringByReplacingEmojiUnicodeToCheatCodes
{
    if (!s_cheatCodesToUnicode) {
        [NSString initializeEmojiCheatCodes];
    }
    
    if (self.length) {
        __block NSMutableString *newText = [NSMutableString stringWithString:self];
        [s_unicodeToCheatCodes enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
            NSString *string = ([obj isKindOfClass:[NSArray class]] ? [obj firstObject] : obj);
            [newText replaceOccurrencesOfString:key withString:string options:NSLiteralSearch range:NSMakeRange(0, newText.length)];
        }];
        return newText;
    }
    return self;
}
+ (void)initializeEmojiCheatCodes
{
    NSDictionary * forwardMap = EMOJI_ChangeText;
   __block NSMutableDictionary *reversedMap = [NSMutableDictionary dictionaryWithCapacity:[forwardMap count]];
    [forwardMap enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if ([obj isKindOfClass:[NSArray class]]) {
            for (NSString *object in obj) {
                [reversedMap setObject:key forKey:object];
            }
        }else{
            [reversedMap setObject:key forKey:obj];
        }
    }];
    @synchronized(self) {
        s_unicodeToCheatCodes = forwardMap;
        s_cheatCodesToUnicode = [reversedMap copy];
    }
}
@end
