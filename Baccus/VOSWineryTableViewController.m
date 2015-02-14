//
//  VOSWineryTableViewController.m
//  Baccus
//
//  Created by Vicente Oliva de la Serna on 15/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSWineryTableViewController.h"
#import "VOSWineViewController.h"


@implementation VOSWineryTableViewController

#pragma mark -  Init

-(id) initWithModel: (VOSWineryModel * ) aModel
              style:(UITableViewStyle) aStyle{
    if (self = [super initWithStyle:aStyle]){
        _model = aModel;
        self.title = @"Baccus";
    }
    return self;
}

#pragma mark -  View lifeCycle

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.5
                                                                           green:0
                                                                            blue:0.13
                                                                           alpha:1];
    
}


#pragma mark - NSUserDefaults
-(NSDictionary *)setDefaults{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    //elegimos por defecto el primero de los vinos tintos
    NSDictionary * defaultWineCoords = @{SECTION_KEY: @(REDWINE_SECTION_NUMBER), ROW_KEY:@0};
    
    // Lo asignamos como valor por defecto
    [defaults setObject:defaultWineCoords
                 forKey:LAST_WINE_KEY];
    
    // Guardamos
    [defaults synchronize];
    
    return defaultWineCoords;
}

-(void)saveLastSelectedWineAtSection:(NSInteger) section row:(NSUInteger) row{
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@{SECTION_KEY: @(section), ROW_KEY:@(row)}
                 forKey:LAST_WINE_KEY];
    
    [defaults synchronize];
}

-(VOSWineModel *)lastSelectedWine{
    NSIndexPath * indexPath = nil;
    NSDictionary * coords = nil;
    
    coords = [[NSUserDefaults standardUserDefaults] objectForKey:LAST_WINE_KEY];
    
    if ( coords == nil ) {
        // No hay ningún valor para la clave LAST_WINE_KEY
        // Esto quiere decir que es la primera vez que se llama a la aplicación , por defecto ponemos igual que teníamos
        // al principio un valor por defecto
        coords = [self setDefaults];
    }
    // Si devuelve algo distinto de nil, quiere decir que ya se había guardado algún valor (último vno seleccionado) y que lo ha recuperado ok.
    
    // Si ya tenemos las coordenadas del último vino seleccionado ( o uno cualquiera por defecto), las convertimos a un NSIndexPath.

    indexPath = [NSIndexPath indexPathForRow:[[coords objectForKey:ROW_KEY] integerValue]
                                   inSection:[[coords objectForKey:SECTION_KEY] integerValue]];

    return [self wineForIndexPath:indexPath];

}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    if (section == REDWINE_SECTION_NUMBER){
        return self.model.redWinesCount;
    }else if (section == WHITEWINE_SECTION_NUMBER){
          return self.model.whiteWinesCount;
    }else{
          return self.model.otherWinesCount;
    }
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if ( section == REDWINE_SECTION_NUMBER){
        return @"Red wines";
    }else if ( section == WHITEWINE_SECTION_NUMBER){
        return @"White wines";
    }else{
        return @"Other wines";
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * cellIdentifier = @"Cell";
    
    // Averiguar de qué vino está pidiendo datos
    VOSWineModel * wine = [self wineForIndexPath:indexPath];
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil){
        // tenemos que crear la celda a mano
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier];
    }

    // sincronizar celda (vista) y modelo (vino)
    cell.imageView.image = wine.photo;
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = wine.wineCompanyName;

    // devolvemos la celda
    return cell;
}

#pragma mark -  Utils

- (VOSWineModel *) wineForIndexPath:(NSIndexPath *)indexPath{
    // Averiguamos de qué vino se trata
    VOSWineModel * wine = nil;
    
    if (indexPath.section == REDWINE_SECTION_NUMBER) {
        wine = [self.model redWineAtIndex:indexPath.row];
    }
    else if (indexPath.section == WHITEWINE_SECTION_NUMBER) {
        wine = [self.model whiteWineAtIndex:indexPath.row];
    }
    else {
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    
    return wine;
}

#pragma mark - VOSWineryTableViewControllerDelegate
-(void)wineryTableViewController:(VOSWineryTableViewController *)wineryVC didSelectedWine:(VOSWineModel *)aModel{
    // creamos el controlador
    VOSWineViewController * wineVC = [[VOSWineViewController alloc] initWithModel:aModel];
    
    // hacemos el push al NavigationController en el que nos encontremos.
    [self.navigationController pushViewController:wineVC
                                         animated:YES];
}

#pragma mark - Table view Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    // suponemos que estamos dentro de un Navigation Controller
    
    // Averiguamos de que vino se trata
    VOSWineModel * wine = [self wineForIndexPath:indexPath];
    
    // Avisamos al delegado
    [self.delegate wineryTableViewController:self didSelectedWine:wine];
    
    // Notificaciones
    NSNotification * notif = [NSNotification notificationWithName:NEW_WINE_NOTIFICATION_NAME
                                                           object:self
                                                         userInfo:@{WINE_KEY: wine}];

    [[NSNotificationCenter defaultCenter] postNotification:notif];
    
    // Salvamos el último vino seleccionado para la próxima vez que se abra la aplicación mostrar el último vino seleccionado.
    [self saveLastSelectedWineAtSection:indexPath.section
                                    row:indexPath.row];
}

@end
