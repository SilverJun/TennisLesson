//
//  PlayListItemTVC.h
//  TennisLesson
//
//  Created by 장 은준 on 2016. 1. 26..
//  Copyright © 2016년 장 은준. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayListItemTVC : UITableViewController
{
    NSMutableArray* Item;
    NSMutableArray* Imgcnt;
    NSMutableArray* Img;
    NSMutableArray* Str;
    int cnt;
}

@property (strong, nonatomic) NSString* PlayListString;


@end
