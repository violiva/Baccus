//
//  VOSWineryModel.h
//  Baccus
//
//  Created by Vicente Oliva de la Serna on 14/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import Foundation;
#import "VOSWineModel.h"


#define REDWINE_SECTION @"Tinto"
#define WHITEWINE_SECTION @"Blanco"
#define OTHERWINE_SECTION @"Rosado"

@interface VOSWineryModel : NSObject

@property (readonly, nonatomic) NSUInteger redWinesCount;
@property (readonly, nonatomic) NSUInteger whiteWinesCount;
@property (readonly, nonatomic) NSUInteger otherWinesCount;

-(VOSWineModel *) redWineAtIndex:(NSUInteger) index;
-(VOSWineModel *) whiteWineAtIndex:(NSUInteger) index;
-(VOSWineModel *) otherWineAtIndex:(NSUInteger) index;

@end
