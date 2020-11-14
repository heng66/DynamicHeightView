//
//  DynamicTableViewCell.m
//  DynamicHeightView
//
//  Created by heng on 2020/11/13.
//

#import "DynamicTableViewCell.h"
#import "DynamicView.h"
#import <Masonry/Masonry.h>

@interface DynamicTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) DynamicView *dynamicView;

@end

@implementation DynamicTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupSubViews];
    }
    return  self;
}

- (void)setupSubViews {
    self.contentView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.dynamicView];
        
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(20.0);
        make.top.mas_equalTo(self.contentView.mas_top).mas_offset(20.0);
    }];
    
    [self.dynamicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10.0).priorityHigh();
        make.bottom.mas_equalTo(self.contentView.mas_bottom).priorityHigh();
    }];

}


#pragma mark - setter

- (void)setDataArr:(NSArray *)dataArr {
    _dataArr = dataArr;
    self.dynamicView.dataArr = dataArr;
    [self.dynamicView.collectionView reloadData];
    [self.dynamicView.collectionView layoutIfNeeded];
}

#pragma mark - getter

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"城市";
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightRegular];
    }
    return  _titleLabel;
}

- (DynamicView *)dynamicView {
    if (!_dynamicView) {
        _dynamicView = [[DynamicView alloc] init];
    }
    return _dynamicView;
}

@end
