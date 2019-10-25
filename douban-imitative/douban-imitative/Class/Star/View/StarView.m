//
//  StarView.m
//  douban-imitative
//
//  Created by Jaya Shen on 2019/10/20.
//  Copyright © 2019 Jaya Shen. All rights reserved.
//

#import "StarView.h"

@implementation StarView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    _scoreLabel = [[UILabel alloc] init];
    [self addSubview:_scoreLabel];
    
    return self;
}

- (void)layoutSubviews {
    
    double score = _starScore / 2 - 0.3;
    
    for (int count = 0; count < 5; count++) {
        UIImageView *StarImage = [[UIImageView alloc] init];
        StarImage.frame = CGRectMake(count * (self.frame.size.height + 2), 0, self.frame.size.height, self.frame.size.height);
        [self addSubview:StarImage];
        if (count <= score - 0.5) {
            StarImage.image = [UIImage imageNamed:@"stars_full"];
        } else {
            if (score - count >= 0 && score - count < 0.5) {
                StarImage.image = [UIImage imageNamed:@"stars_half"];
            } else {
                StarImage.image = [UIImage imageNamed:@"stars_empty"];
            }
        }
    }
    
    _scoreLabel.frame = CGRectMake( 5 * self.frame.size.height + 12, 0, self.frame.size.width - 5 * self.frame.size.height - 12, self.frame.size.height);
    _scoreLabel.text = [NSString stringWithFormat:@"%.1f", _starScore];
    _scoreLabel.textColor = [UIColor grayColor];
    _scoreLabel.font = [UIFont systemFontOfSize:10];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
