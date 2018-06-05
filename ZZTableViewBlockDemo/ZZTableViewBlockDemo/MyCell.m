//
//  MyCell.m
//  demo
//
//  Created by 赵振磊 on 2018/6/5.
//  Copyright © 2018年 赵振磊. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _title = [[UILabel alloc] initWithFrame:self.bounds];
        _title.textColor = [UIColor redColor];
        _title.font = [UIFont systemFontOfSize:20];
        [self addSubview:_title];
    }
    return self;
}

@end
