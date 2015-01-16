//
//  VOSWineryTableViewController.h
//  Baccus
//
//  Created by Vicente Oliva de la Serna on 15/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import UIKit;
#import "VOSWineryModel.h"
#import "VOSWineryModel.h"

#define REDWINE_SECTION 0
#define WHITEWINE_SECTION 1
#define OTHERWINE_SECTION 2

@class VOSWineryTableViewController;

@protocol VOSWineryTableViewControllerDelegate <NSObject>

-(void) wineryTableViewController:(VOSWineryTableViewController *) wineryVC
                  didSelecteWine:(VOSWineModel *) aModel;
@end

@interface VOSWineryTableViewController : UITableViewController

@property (strong, nonatomic) VOSWineryModel * model;
@property (weak, nonatomic) id<VOSWineryTableViewControllerDelegate> delegate;


-(id) initWithModel: (VOSWineryModel * ) aModel
              style:(UITableViewStyle) aStyle;

@end
