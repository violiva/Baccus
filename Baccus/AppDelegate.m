//
//  AppDelegate.m
//  Baccus
//
//  Created by Vicente Oliva de la Serna on 23/12/14.
//  Copyright (c) 2014 Vicente Oliva de la Serna. All rights reserved.
//


/*
#define REDWINE_SECTION 0
#define WHITEWINE_SECTION 1
#define OTHERWINE_SECTION 2
*/

#define IS_IPHONE UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone


#import "AppDelegate.h"
#import "VOSWineModel.h"
#import "VOSWineViewController.h"
#import "VOSWebViewController.h"
#import "VOSWineryModel.h"
#import "VOSWineryTableViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Creamos el modelo
    VOSWineryModel * winery = [[VOSWineryModel alloc] init];
    

    // Antes de crear los controladores determinamos el tipo de dispositivo.
    UIViewController * rootVC = nil;
    
    if ( !IS_IPHONE ){
        // tableta
        rootVC = [self rootViewControllerForPadWithModel:winery];
    }else{
        // teléfono
        rootVC = [self rootViewControllerForPhoneWithModel:winery];
    }
    self.window.rootViewController = rootVC;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(UIViewController *)rootViewControllerForPhoneWithModel:(VOSWineryModel *)model{

    // creamos el controlador principal
    VOSWineryTableViewController * wineryVC = [[VOSWineryTableViewController alloc] initWithModel:model style:UITableViewStylePlain];

    // creamos el Navigation Controller
    UINavigationController * wineryNav = [[UINavigationController alloc] initWithRootViewController:wineryVC];

    // Asignamos delegado
    wineryVC.delegate = wineryVC;

    return wineryNav;
}

-(UIViewController *)rootViewControllerForPadWithModel:(VOSWineryModel *)model{
    
    // creamos los controladores
    VOSWineryTableViewController * wineryVC = [[VOSWineryTableViewController alloc] initWithModel:model style:UITableViewStylePlain];
    VOSWineViewController * wineVC = [[VOSWineViewController alloc] initWithModel:[wineryVC lastSelectedWine]];
    
    // creamos los Navigation Controllers
    UINavigationController * wineryNav = [[UINavigationController alloc] initWithRootViewController:wineryVC];
    UINavigationController * wineNav = [[UINavigationController alloc] initWithRootViewController:wineVC];
    
    // Creamos el combinador - SplitViewController
    UISplitViewController * splitVC = [[UISplitViewController alloc] init];
    [splitVC setViewControllers:@[wineryNav, wineNav]];
    
    // Asignamos delegado
    splitVC.delegate = wineVC;
    wineryVC.delegate = wineVC;
    
    return splitVC;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
