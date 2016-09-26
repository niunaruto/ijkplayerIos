//
//  NNLiveModel.h
//  NNLiveApp
//
//  Created by anlaiye on 16/9/26.
//  Copyright © 2016年 NT. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface NNLiveCreatorModel : JSONModel

@property (nonatomic, copy) NSString<Optional> *gender;
@property (nonatomic, copy) NSString<Optional> *level;
@property (nonatomic, copy) NSString<Optional> *nick;
@property (nonatomic, copy) NSString<Optional> *portrait;
@end

@interface NNLiveModel : JSONModel
@property (nonatomic, copy) NSString<Optional> *city;
@property (nonatomic, copy) NSString<Optional> *optimal;
@property (nonatomic, copy) NSString<Optional> *link;
@property (nonatomic, copy) NSString<Optional> *multi;
@property (nonatomic, copy) NSString<Optional> *online_users;
@property (nonatomic, strong) NNLiveCreatorModel <Optional>      *creator;
@end





