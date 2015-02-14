//
//  VOSWineryModel.m
//  Baccus
//
//  Created by Vicente Oliva de la Serna on 14/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSWineryModel.h"
#import "VOSWineModel.h"

@interface VOSWineryModel()

@property (strong, nonatomic) NSMutableArray * redWines;
@property (strong, nonatomic) NSMutableArray * whiteWines;
@property (strong, nonatomic) NSMutableArray * otherWines;

@end


@implementation VOSWineryModel

#pragma mark -  Properties

-(NSUInteger) redWinesCount{
    return [self.redWines count];
}

-(NSUInteger) whiteWinesCount{
    return [self.whiteWines count];
}

-(NSUInteger) otherWinesCount{
    return [self.otherWines count];
}

#pragma mark -  Init

-(id) init{
    if (self = [super init]){
        
        // Creamos una NSUrlRequest para descargar los datos desde la URL dónde los tenemos.
        NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://baccusapp.herokuapp.com/wines"]];
        
        NSURLResponse * response = [[NSURLResponse alloc] init];

        NSError * error;
        NSData * data = [NSURLConnection sendSynchronousRequest:request
                                              returningResponse:&response
                                                          error:&error];

        if ( data != nil ){
            // No ha habido error
            
            NSArray * JSONObjects = [NSJSONSerialization JSONObjectWithData:data
                                                                    options:kNilOptions
                                                                      error:&error];
            
            if ( JSONObjects != nil ){
                // No ha habido error
                for ( NSDictionary * dict in JSONObjects){
                    VOSWineModel * wine = [[VOSWineModel alloc] initWithDictionary:dict];
                    
                    // añadimos al tipo de uva seleccionado
                    if ([wine.type isEqualToString:REDWINE_SECTION]){
                        if (!self.redWines ){
                            self.redWines = [NSMutableArray arrayWithObject:wine];
                        }else{
                            [self.redWines addObject:wine];
                        }
                    }else if ([wine.type isEqualToString:WHITEWINE_SECTION]){
                        if (!self.whiteWines ){
                            self.whiteWines = [NSMutableArray arrayWithObject:wine];
                        }else{
                            [self.whiteWines addObject:wine];
                        }
                    }else {
                        if (!self.otherWines ){
                            self.otherWines = [NSMutableArray arrayWithObject:wine];
                        }else{
                            [self.otherWines addObject:wine];
                        }
                    }
                }
            }else{
                NSLog(@"Se ha producido un error al parsear JSON: %@", error.localizedDescription);
            }
        }else{
            NSLog(@"Se ha producido un error al descargar datos del servidor: %@", error.localizedDescription);
        }
        
    }
    return self;
}

#pragma mark -  Others

-(VOSWineModel *) redWineAtIndex:(NSUInteger) index{
    return [self.redWines objectAtIndex:index];
}

-(VOSWineModel *) whiteWineAtIndex:(NSUInteger) index{
    return [self.whiteWines objectAtIndex:index];
}

-(VOSWineModel *) otherWineAtIndex:(NSUInteger) index{
    return [self.otherWines objectAtIndex:index];
}


@end
