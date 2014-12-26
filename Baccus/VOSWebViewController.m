//
//  VOSWebViewController.m
//  Baccus
//
//  Created by Vicente Oliva de la Serna on 26/12/14.
//  Copyright (c) 2014 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSWebViewController.h"

@implementation VOSWebViewController

-(id) initWithModel: (VOSWineModel *) aModel{
    if ( self = [super initWithNibName:nil
                                bundle:nil]){
        _model = aModel;
        
        self.title = @"Web";
        
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self displayURL: self.model.wineCompanyWeb];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UIWebViewDelegate
-(void) webViewDidFinishLoad:(UIWebView *)webView{
    self.activityView.hidden = YES;
    [self.activityView stopAnimating];
    
}

#pragma mark -Utils
-(void) displayURL: (NSURL *) aURL{
    
    self.browser.delegate = self;
    
    self.activityView.hidden = NO;
    [self.activityView startAnimating];
    
    [self.browser loadRequest:[NSURLRequest requestWithURL: aURL]];
    

}

@end
