//
//  PlayVideoVC.h
//  TennisLesson
//
//  Created by 장 은준 on 2016. 1. 26..
//  Copyright © 2016년 장 은준. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YTPlayerView.h"

@class YTPlayerView;

@interface PlayVideoVC : UIViewController
@property (strong, nonatomic) NSString *URLString;
@property (strong, nonatomic) IBOutlet YTPlayerView *VideoView;

@end
