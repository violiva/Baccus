//
//  VOSWineViewController.h
//  Baccus
//
//  Created by Vicente Oliva de la Serna on 23/12/14.
//  Copyright (c) 2014 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VOSWineModel.h"
#import "VOSWineryTableViewController.h"

@interface VOSWineViewController : UIViewController <UISplitViewControllerDelegate, VOSWineryTableViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *wineryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *originLabel;
@property (weak, nonatomic) IBOutlet UILabel *grapesLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *ratingViews;

@property (strong, nonatomic) VOSWineModel *model;

-(id) initWithModel: (VOSWineModel *) aModel;

-(IBAction)displayWeb:(id)sender;

@end
