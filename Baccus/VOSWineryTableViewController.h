//
//  VOSWineryTableViewController.h
//  Baccus
//
//  Created by Vicente Oliva de la Serna on 15/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import UIKit;
#import "VOSWineryModel.h"

#define REDWINE_SECTION   @"Tinto"
#define WHITEWINE_SECTION @"Blanco"
#define OTHERWINE_SECTION @"Rosado"
#define REDWINE_SECTION_NUMBER   0
#define WHITEWINE_SECTION_NUMBER 1
#define OTHERWINE_SECTION_NUMBER 2

#define NEW_WINE_NOTIFICATION_NAME @"newWine"
#define WINE_KEY @"wine"

#define SECTION_KEY @"section"
#define ROW_KEY @"row"
#define LAST_WINE_KEY @"lastWine"

@class VOSWineryTableViewController;

@protocol VOSWineryTableViewControllerDelegate <NSObject>

-(void) wineryTableViewController:(VOSWineryTableViewController *) wineryVC
                  didSelectedWine:(VOSWineModel *) aModel;
@end

@interface VOSWineryTableViewController : UITableViewController

@property (strong, nonatomic) VOSWineryModel * model;
@property (weak, nonatomic) id<VOSWineryTableViewControllerDelegate> delegate;


-(id) initWithModel: (VOSWineryModel * ) aModel
              style:(UITableViewStyle) aStyle;

- (VOSWineModel *)lastSelectedWine;

@end
