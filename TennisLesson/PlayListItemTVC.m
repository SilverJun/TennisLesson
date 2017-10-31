//
//  PlayListItemTVC.m
//  TennisLesson
//
//  Created by 장 은준 on 2016. 1. 26..
//  Copyright © 2016년 장 은준. All rights reserved.
//

#import "PlayListItemTVC.h"
#import "PlayListItemTVCell.h"
#import "PlayVideoVC.h"

@interface PlayListItemTVC ()

@end

@implementation PlayListItemTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    Item = [NSMutableArray array];
    
    
    NSString *str = [NSString stringWithFormat:@"%@%@%@", @"https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&q=정진화&playlistId=", _PlayListString, @"&key=AIzaSyBUQCoYqsWQ_su-K7wnkW-dHbn-S8imGtk&maxResults=50"];
    
    NSString* nextPageToken;
    
    str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:str];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    
    NSError *error;
    
    NSData* data = [NSData dataWithContentsOfURL:url options:NSDataReadingMappedIfSafe error:&error];
    
    NSDictionary* dic;
    
    dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    
    cnt = [[[dic valueForKey:@"pageInfo"] objectForKey:@"totalResults"] intValue];
    
    if (Img != nil) {
        Img = nil;
        Imgcnt = nil;
        Str = nil;
    }
    
    Imgcnt = [NSMutableArray arrayWithCapacity:cnt];
    Img = [NSMutableArray arrayWithCapacity:cnt];
    Str = [NSMutableArray arrayWithCapacity:cnt];
    for (int i = 0; i < cnt; i++) {
        [Imgcnt addObject:[NSNumber numberWithInt:-1]];
        [Img addObject:[NSData data]];
        [Str addObject:@"null"];
    }
    
    [Item addObjectsFromArray:[dic valueForKey:@"items"]];
    
    nextPageToken = [dic valueForKey:@"nextPageToken"];
    
    while (nextPageToken != nil)
    {
        NSString* st = [NSString stringWithFormat:@"%@&pageToken=%@", str, nextPageToken];
        url = [NSURL URLWithString:st];
        request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"GET"];
        data = [NSData dataWithContentsOfURL:url options:NSDataReadingMappedIfSafe error:&error];
        dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        [Item addObjectsFromArray:[dic valueForKey:@"items"]];
        nextPageToken = [dic valueForKey:@"nextPageToken"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return cnt;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayListItemTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayListItemCell"forIndexPath:indexPath];
    
    long row = [indexPath row];
    NSNumber* temp = [NSNumber numberWithInt:-1];
    
    if ([Imgcnt[row] compare:temp] == NSOrderedSame) {
        Imgcnt[row] = [NSNumber numberWithInt:1];
        NSString* str = [[[[Item[row] valueForKey:@"snippet"] valueForKey:@"thumbnails"] valueForKey:@"default"] valueForKey:@"url"];
        str = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL* url = [NSURL URLWithString:str];
        NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"GET"];
        
        NSError* error;
        
        Img[row] = [NSData dataWithContentsOfURL:url options:NSDataReadingMappedIfSafe error:&error];
        
        Str[row] = [[Item[row] valueForKey:@"snippet"] valueForKey:@"title"];
    }
    
    cell.Image.image = [UIImage imageWithData:Img[row]];
    
    cell.Label.text = Str[row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString: @"ShowVideo"]) {
        PlayVideoVC *playVideoVC = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        long row = [myIndexPath row];
        
        playVideoVC.URLString = [[[Item[row] valueForKey:@"snippet"]
        valueForKey:@"resourceId"] valueForKey:@"videoId"];
    }
}

@end
