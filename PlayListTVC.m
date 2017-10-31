//
//  PlayListTVC.m
//  TennisLesson
//
//  Created by 장 은준 on 2016. 1. 26..
//  Copyright © 2016년 장 은준. All rights reserved.
//


#import "PlayListTVC.h"
#import "PlayListTVCell.h"
#import "PlayListItemTVC.h"

static NSString* ImgStr[] = {
    @"serve.jpg",
    @"forehand.jpg",
    @"backhand.jpg",
    @"forehand volley.jpg",
    @"backhand volley.jpg",
    @"smash.jpg",
    @"return.jpg",
    @"lob.jpg",
    @"approach.jpg"
};

static NSString* PlayListID[] = {
    @"PLAb3Sji4i29nv037Fs3iPDJmb5pzhhfW4",
    @"PLAb3Sji4i29lO5SP9aENlzTt4S0UjwkaI",
    @"PLAb3Sji4i29mMRtEgwkWy6o7SnKP2-D9J",
    @"PLAb3Sji4i29lcJHZZtjYCxjtg37KfjOp-",
    @"PLAb3Sji4i29nzAQsXNgd9N72GQZl7BRmN",
    @"PLAb3Sji4i29k-VaWePrXgZeP4qPMKYP5R",
    @"PLAb3Sji4i29leebJ571vM6yHEOrNAtBtU",
    @"PLAb3Sji4i29kZ-6XLLQeMQBEBhQHbXSoQ",
    @"PLAb3Sji4i29kDqFrykUjlAp2CNvbqrqnm"
};

@interface PlayListTVC ()

@end

@implementation PlayListTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cnt = 9;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return cnt;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayListTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayListCell" forIndexPath:indexPath];
    long row = [indexPath row];
    
    cell.Image.image = [UIImage imageNamed:ImgStr[row]];
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return tableView.contentSize.width * 0.75f;
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
    if ([[segue identifier] isEqualToString: @"ShowPlayListItem"]) {
        PlayListItemTVC *playListItemTVC = [segue destinationViewController];
        NSIndexPath *myIndexPath = [self.tableView indexPathForSelectedRow];
        
        long row = [myIndexPath row];
        
        playListItemTVC.PlayListString = PlayListID[row];
    }
}


@end
