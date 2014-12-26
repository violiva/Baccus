//
//  VOSWebViewController.h
//  Baccus
//
//  Created by Vicente Oliva de la Serna on 26/12/14.
//  Copyright (c) 2014 Vicente Oliva de la Serna. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VOSWineModel.h"

@interface VOSWebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) VOSWineModel *model;
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

-(id) initWithModel: (VOSWineModel *) aModel;
@end
