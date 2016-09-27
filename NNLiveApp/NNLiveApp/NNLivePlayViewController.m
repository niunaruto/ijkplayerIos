//
//  NNLivePlayViewController.m
//  NNLiveApp
//
//  Created by anlaiye on 16/9/27.
//  Copyright © 2016年 NT. All rights reserved.
//

#import "NNLivePlayViewController.h"
#import "NNLiveModel.h"
#import <UIImageView+AFNetworking.h>
#import <Masonry.h>
#import <IJKMediaFramework/IJKMediaFramework.h>
@interface NNLivePlayViewController ()
@property (nonatomic, strong) UIImageView      *imageView;
@property (nonatomic, strong) IJKFFMoviePlayerController *player;
@end

@implementation NNLivePlayViewController
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [UIImageView new];
    }
    return _imageView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(-10);
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 设置直播占位图片
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",_liveModel.creator.portrait]];
    [self.imageView setImageWithURL:imageUrl];
    
    // 拉流地址
    NSURL *url = [NSURL URLWithString:_liveModel.stream_addr];
    
    // 创建IJKFFMoviePlayerController：专门用来直播，传入拉流地址就好了
    IJKFFMoviePlayerController *playerVc = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:nil];
    
    // 准备播放
    [playerVc prepareToPlay];
    
    // 强引用，反正被销毁
    _player = playerVc;
    
    playerVc.view.frame = [UIScreen mainScreen].bounds;
    
    [self.view insertSubview:playerVc.view atIndex:1];
}


- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 界面消失，一定要记得停止播放
    [_player pause];
    [_player stop];
    [_player shutdown];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
