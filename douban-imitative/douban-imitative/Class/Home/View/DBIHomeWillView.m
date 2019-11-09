//
//  DBIHomeWillView.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/19.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "DBIHomeWillView.h"
#import "Masonry.h"

@implementation DBIHomeWillView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    _willButtonArray = [NSMutableArray array];
    
    for (int i = 0; i < 6; i++) {
        DBIHomeWillButton *willButton = [[DBIHomeWillButton alloc] init];
        willButton.tag = i;
        [self addSubview:willButton];
        [_willButtonArray addObject:willButton];
    }
    
    return self;
}

- (void)layoutSubviews {
    int flag = 0;
    for (int i = 0; i < 2; i++) {
        for (int j = 0; j < 3; j++) {
            DBIHomeWillButton *willButton = [[DBIHomeWillButton alloc] init];
            willButton = _willButtonArray[flag++];
//            [willButton mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.top.equalTo(self).offset(i * (1.61 * (self.bounds.size.width - 50) / 3 + 70));
//                make.left.equalTo(self).offset(15 + ((self.bounds.size.width - 50) / 3 + 10) * j);
//                make.width.equalTo(@((self.bounds.size.width - 50) / 3));
//                make.height.equalTo(@(1.61 * (self.bounds.size.width - 50) / 3 + 70));
//            }];
            willButton.frame = CGRectMake( 15 + ((self.bounds.size.width - 50) / 3 + 10) * j, i * (1.61 * (self.bounds.size.width - 50) / 3 + 70 + 10), ((self.bounds.size.width - 50) / 3), (1.61 * (self.bounds.size.width - 50) / 3 + 70));
            [willButton addTarget:self action:@selector(ClickWillButton:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (void)ClickWillButton:(DBIHomeWillButton *)btn {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ClickWillButton" object:btn];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
