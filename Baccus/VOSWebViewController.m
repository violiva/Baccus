//
//  VOSWebViewController.m
//  Baccus
//
//  Created by Vicente Oliva de la Serna on 26/12/14.
//  Copyright (c) 2014 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSWebViewController.h"
#import "VOSWineryTableViewController.h"

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
    
    // Alta en Centro de notificaciones
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    [center addObserver:self
               selector:@selector(wineDidChange:)
                   name:NEW_WINE_NOTIFICATION_NAME
                 object:nil];
}

-(void)wineDidChange:(NSNotification *) notification{
    NSDictionary * dictionary = [notification userInfo];
    VOSWineModel * newWine = [dictionary objectForKey:WINE_KEY];
    
    // Actualizamos el modelo
    self.model = newWine;

    // En caso de que el título fuera en base al modelo tendríamos que ponerlo aquí, en este caso no es necesario y se puede omitir esta línea
    self.title = @"Web";
    
    [self displayURL:self.model.wineCompanyWeb];
    
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    // Baja del centro de notificaciones
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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
