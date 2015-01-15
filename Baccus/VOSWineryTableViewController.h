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

@interface VOSWineryTableViewController : UITableViewController

@property (strong, nonatomic) VOSWineryModel * model;

-(id) initWithModel: (VOSWineryModel * ) aModel
              style:(UITableViewStyle) aStyle;

@end
