//
//  ViewController.m
//  Emoji
//
//  Created by Vieene on 16/6/23.
//  Copyright © 2016年 hhly. All rights reserved.
//

#import "ViewController.h"
#import "NSString+TYHEmoji.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *str = @"☀️🌛💗❤️😊😢👌&#x02049;&#x02122;&#x02139;&#x02194;&#x02195;&#x02196;&#x02197;&#x02198;&#x02199;\
    ";
    UITextView *emojiView1 = [[UITextView alloc] initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width,  self.view.bounds.size.height/2.0)];
    emojiView1.text = [str stringByReplacingEmojiCheatCodesToUnicode];
    emojiView1.font = [UIFont systemFontOfSize:18.0f];
    emojiView1.editable = NO;
    [self.view addSubview:emojiView1];
    
    UITextView *emojiView2 = [[UITextView alloc] initWithFrame:CGRectMake(0,self.view.bounds.size.height/2.0, self.view.bounds.size.width,  self.view.bounds.size.height/2.0)];
    emojiView2.text = [str stringByReplacingEmojiUnicodeToCheatCodes];
    emojiView2.font = [UIFont systemFontOfSize:18.0f];
    emojiView2.editable = NO;
    emojiView2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:emojiView2];
}

@end
