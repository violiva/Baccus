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

@property (strong, nonatomic) NSArray * redWines;
@property (strong, nonatomic) NSArray * whiteWines;
@property (strong, nonatomic) NSArray * otherWines;

@end


@implementation VOSWineryModel

-(NSUInteger) redWinesCount{
    return [self.redWines count];
}

-(NSUInteger) whiteWinesCount{
    return [self.whiteWines count];
}

-(NSUInteger) otherWinesCount{
    return [self.otherWines count];
}


-(id) init{
    if (self = [super init]){
        VOSWineModel *tintorro = [VOSWineModel wineWithName:@"Bembibre"
                                            wineCompanyName:@"Dominio de Tares"
                                                       type:@"Tinto"
                                                     origin:@"El Bierzo"
                                                     grapes:@[@"Mencia"]
                                             wineCompanyWeb:[NSURL URLWithString:@"http://www.dominiodetares.com/index.php/es/vinos/bembibre"]  //   http://www.20minutos.es/
                                                      notes:@"Este vino muestra toda la complejidad y la elegancia de la variedad Mencía. En fase visual luce un color rojo picota muy cubierto con tonalidades en el menisco. En nariz aparecen recuerdos frutales muy intensos de frutas rojas (frambuesa, cereza) y una potente ciruela negra, así como tonos florales de la gama de las rosas y violetas, vegetales muy elegantes y complementarios, hojarasca verde, tabaco y maderas aromáticas (sándalo) que le brindan un toque ciertamente perfumado."
                                                     rating:3
                                                      photo:[UIImage imageNamed:@"bembibre.jpg"]];

        VOSWineModel *albarinno = [VOSWineModel wineWithName:@"Zárate"
                                             wineCompanyName:@"Zárate"
                                                        type:@"white"
                                                      origin:@"Rias Bajas"
                                                      grapes:@[@"Albariño"]
                                              wineCompanyWeb:[NSURL URLWithString:@"http://bodegas-zarate.com/productos/vinos/albarino-zarate/"]
                                                       notes:@"El albariño Zarate es un vino blanco monovarietal que pertenece a la Denominación de Origen Rías Baixas. Considerado por la crítica especializada como uno de los grandes vinos blancos del mundo, el albariño ya es todo un mito."
                                                      rating:4
                                                       photo:[UIImage imageNamed:@"zarate.gif"]];
    
        VOSWineModel *champagne = [VOSWineModel wineWithName:@"Comtes de Champagne"
                                             wineCompanyName:@"Champagne Taittinger"
                                                        type:@"other"
                                                      origin:@"Champagne"
                                                      grapes:@[@"Chardonnay"]
                                              wineCompanyWeb:[NSURL URLWithString:@"http://www.taittinger.fr"]
                                                       notes:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac nunc purus. Curabitur eu velit mauris. Curabitur magna nisi, ullamcorper ac bibendum ac, laoreet et justo. Praesent vitae tortor quis diam luctus condimentum. Suspendisse potenti. In magna elit, interdum sit amet facilisis dictum, bibendum nec libero. Maecenas pellentesque posuere vehicula. Vivamus eget nisl urna, quis egestas sem. Vivamus at venenatis quam. Sed eu nulla a orci fringilla pulvinar ut eu diam. Morbi nibh nibh, bibendum at laoreet egestas, scelerisque et nisi. Donec ligula quam, semper nec bibendum in, semper eget dolor. In hac habitasse platea dictumst. Maecenas adipiscing semper rutrum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;"
                                                      rating:5
                                                       photo:[UIImage imageNamed:@"comtesDeChampagne.jpg"]];

        self.redWines = @[tintorro];
        self.whiteWines = @[albarinno];
        self.otherWines = @[champagne];
    }
    return self;
}


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
