//
//  DBIHomeHotView.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/13.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIHomeHotView.h"
#import "DBIHomeHotButton.h"
#import "Masonry.h"

@implementation DBIHomeHotView

- (void)layoutSubviews {
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            DBIHomeHotButton *hotButton = [[DBIHomeHotButton alloc] init];
            hotButton.frame = CGRectMake( 15 + ((self.bounds.size.width - 50) / 3 + 10) * j, i * (1.61 * (self.bounds.size.width - 50) / 3 + 40 + 10), ((self.bounds.size.width - 50) / 3), (1.61 * (self.bounds.size.width - 50) / 3 + 40));
            [self addSubview:hotButton];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
