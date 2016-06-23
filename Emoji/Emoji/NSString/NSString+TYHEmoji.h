//
//  NSString+TYHEmoji.h
//  NSStringEmojize
//
//  Created by Vieene on 16/6/23.
//  Copyright © 2016年 DIY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (TYHEmoji)

/*&#x1F602--->\U0001F602*/
- (NSString *)stringByReplacingEmojiCheatCodesToUnicode;

/*\U0001F602--->&#x1F602*/
- (NSString *)stringByReplacingEmojiUnicodeToCheatCodes;

@end
