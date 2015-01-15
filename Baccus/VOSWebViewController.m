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

#pragma mark - UIWebViewDelegate
-(void) webViewDidFinishLoad:(UIWebView *)webView{
    self.activityView.hidden = YES;
    [self.activityView stopAnimating];
    
}

// Si nos interesa limitar que la página web no pueda navegar a más enlaces, podemos limitar su funcionamiento modificando el comportamiento del delegado
-(BOOL) webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType{
    if ((navigationType == UIWebViewNavigationTypeLinkClicked) || (navigationType == UIWebViewNavigationTypeFormSubmitted) ){
        return NO;
    } else {
        return YES;
    }
}

#pragma mark -Utils
-(void) displayURL: (NSURL *) aURL{
    
    self.browser.delegate = self;

    self.activityView.hidden = NO;
    [self.activityView startAnimating];
    
    [self.browser loadRequest:[NSURLRequest requestWithURL: aURL]];

}

@end
