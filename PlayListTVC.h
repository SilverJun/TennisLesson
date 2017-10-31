//
//  PlayListTVC.h
//  TennisLesson
//
//  Created by 장 은준 on 2016. 1. 26..
//  Copyright © 2016년 장 은준. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayListTVC : UITableViewController
{
    NSMutableArray* Item;
    int cnt;
    enum list{
        Serve = 0,
        Forehand,
        Backhand,
        Fvolley,
        Bvolley,
        Smash,
        Return,
        Lob,
        Approach
    };
}

@end
