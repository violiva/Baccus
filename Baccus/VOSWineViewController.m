//
//  VOSWineViewController.m
//  Baccus
//
//  Created by Vicente Oliva de la Serna on 23/12/14.
//  Copyright (c) 2014 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSWineViewController.h"
#import "VOSWebViewController.h"
#import "VOSWineryTableViewController.h"

//@interface VOSWineViewController ()
//
//@end

@implementation VOSWineViewController 

-(id) initWithModel: (VOSWineModel *) aModel{
    
    if ( self = [super initWithNibName:nil
                                bundle:nil]){

        _model = aModel;
        self.title = aModel.name;
        
    }
    return self;
}

// Para mantener sincronizados siempre modelo y vista
-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self syncModelWithView];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.5
                                                                        green:0
                                                                         blue:0.13
                                                                        alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
-(IBAction)displayWeb:(id)sender{
    
    // Creamos el ViewController
    VOSWebViewController *webVC = [[VOSWebViewController alloc] initWithModel:self.model];
    
    // Hacemos push para añadir el controlador en el NavigationController
    [self.navigationController pushViewController:webVC
                                         animated:YES];
}

#pragma mark -utils
-(void) syncModelWithView{
    self.nameLabel.text = self.model.name;
    self.wineryNameLabel.text = self.model.wineCompanyName;
    self.grapesLabel.text = [self arrayToString:self.model.grapes];
    self.typeLabel.text = self.model.type;
    self.originLabel.text = self.model.origin;
    [self displayRating: self.model.rating];
    self.notesLabel.text = self.model.notes;
    self.photoView.image = self.model.photo;
    

}

-(void) clearRatings{
    for (UIImageView *imgView in self.ratingViews){
        imgView.image = nil;
    }
}

-(void) displayRating:(int) aRating{
    [self clearRatings];
    UIImage *glass = [UIImage imageNamed:@"splitView_score_glass@2x.png"];
    for ( int i= 0; i < aRating; i++){
        [[self.ratingViews objectAtIndex:i] setImage:glass];
    }
}

-(NSString *) arrayToString: (NSArray *) anArray{
    NSString *repr = nil;
    if ([anArray count] == 1){
        repr = [@"100% " stringByAppendingString:[anArray lastObject]];
    }else{
        repr = [[anArray componentsJoinedByString:@", "] stringByAppendingString:@"."];
    }
    return repr;
}

#pragma mark - UISplitViewControllerDelegate
-(void)splitViewController:(UISplitViewController *)svc willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode{
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        
        // Hay que poner el botón en mi barra de navegación
        self.navigationItem.rightBarButtonItem = svc.displayModeButtonItem;

    }else if (displayMode == UISplitViewControllerDisplayModeAllVisible){
        
        // Hay que quitar el botón de la barra de navegación
        self.navigationItem.rightBarButtonItem = nil;
    }

}

#pragma mark - VOSWineryTableViewControllerDelegate
-(void)wineryTableViewController:(VOSWineryTableViewController *) wineryVC
                 didSelectedWine: (VOSWineModel *) aWine{
    self.model = aWine;
    self.title = aWine.name;
    
    [self syncModelWithView];
}

@end
