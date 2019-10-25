//
//  DBIHomeWillView.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/19.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIHomeWillView.h"
#import "DBIHomeWillButton.h"
#import "Masonry.h"

@implementation DBIHomeWillView

- (void)layoutSubviews {
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            DBIHomeWillButton *willButton = [[DBIHomeWillButton alloc] init];
//            [willButton mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(self).offset(i * (1.61 * (self.bounds.size.width - 50) / 3 + 70));
//                make.left.equalTo(self).offset(15 + ((self.bounds.size.width - 50) / 3 + 10) * j);
//                make.width.equalTo(@((self.bounds.size.width - 50) / 3));
//                make.height.equalTo(@(1.61 * (self.bounds.size.width - 50) / 3 + 70));
//            }];
            willButton.frame = CGRectMake( 15 + ((self.bounds.size.width - 50) / 3 + 10) * j, i * (1.61 * (self.bounds.size.width - 50) / 3 + 70 + 10), ((self.bounds.size.width - 50) / 3), (1.61 * (self.bounds.size.width - 50) / 3 + 70));
            [self addSubview:willButton];
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
