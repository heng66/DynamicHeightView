//
//  DynamicCollectionViewCell.m
//  DynamicHeightView
//
//  Created by heng on 2020/11/13.
//

#import "DynamicCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface DynamicCollectionViewCell()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation DynamicCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.contentView);
    }];
}

#pragma mark - setter

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

#pragma mark - getter

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blueColor];
        _titleLabel.backgroundColor = [UIColor orangeColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    }
    return  _titleLabel;
}

@end
