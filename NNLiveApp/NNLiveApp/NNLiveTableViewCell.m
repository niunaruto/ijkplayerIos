//
//  NNLiveTableViewCell.m
//  NNLiveApp
//
//  Created by anlaiye on 16/9/27.
//  Copyright © 2016年 NT. All rights reserved.
//

#import "NNLiveTableViewCell.h"
#import <Masonry.h>
#import "NNLiveModel.h"
#import <UIButton+AFNetworking.h>
#import <UIImageView+AFNetworking.h>
@interface NNLiveTableViewCell ()
@property (nonatomic, strong) UIButton      *iconUser;
@property (nonatomic, strong) UILabel      *nickName;
@property (nonatomic, strong) UIButton      *addressBtn;
@property (nonatomic, strong) UILabel      *nums;
@property (nonatomic, strong) UIImageView      *backImage;
@end

@implementation NNLiveTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.iconUser];
        [self.contentView addSubview:self.nickName];
        [self.contentView addSubview:self.backImage];
        [self.iconUser mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(10);
            make.size.mas_equalTo(CGSizeMake(36, 36));
            
        }];
        [self.nickName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconUser.mas_right).offset(5);
            make.bottom.equalTo(self.iconUser.mas_centerX);
        }];
        
        [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.contentView);
            make.top.equalTo(self.iconUser.mas_bottom).offset(10);
            make.height.mas_equalTo(190);
            
        }];
        UIView *lineView = [UIView new];
        [self.contentView addSubview:lineView];
        lineView.backgroundColor = [UIColor clearColor];
        [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self.contentView);
            make.height.mas_equalTo(10);
        }];
    }
    return self;
}
- (void)setLiveModel:(NNLiveModel *)liveModel{
    _liveModel = liveModel;
    [self.iconUser setImageForState:UIControlStateNormal withURL: [NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",liveModel.creator.portrait]]];
    self.nickName.text = liveModel.creator.nick;
    [self.backImage setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",liveModel.creator.portrait]]];
}
- (UIImageView *)backImage{
    if (!_backImage) {
        _backImage = [UIImageView new];
        _backImage.layer.cornerRadius = 5;
        _backImage.layer.masksToBounds = YES;
        
    }
    return _backImage;
}
- (UILabel *)nickName{
    if (!_nickName) {
        _nickName = [UILabel new];
        _nickName.font = [UIFont systemFontOfSize:13];
        _nickName.textColor = [UIColor blackColor];
    }
    return _nickName;
}

- (UIButton *)iconUser{
    if (!_iconUser) {
        _iconUser = [UIButton new];
    }
    return _iconUser;
}
@end
