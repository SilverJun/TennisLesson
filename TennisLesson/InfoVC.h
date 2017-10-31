//
//  InfoVC.h
//  TennisLesson
//
//  Created by 장 은준 on 2016. 1. 26..
//  Copyright © 2016년 장 은준. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GADBannerView;

@interface InfoVC : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *Label;
@property (weak, nonatomic) IBOutlet GADBannerView *bannerView;
@property (weak, nonatomic) IBOutlet UITextView *InfoText;
@end

