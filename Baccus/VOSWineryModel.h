//
//  VOSWineryModel.h
//  Baccus
//
//  Created by Vicente Oliva de la Serna on 14/1/15.
//  Copyright (c) 2015 Vicente Oliva de la Serna. All rights reserved.
//

@import Foundation;
#import "VOSWineModel.h"


#define REDWINE_SECTION 0
#define WHITEWINE_SECTION 1
#define OTHERWINE_SECTION 2

@interface VOSWineryModel : NSObject

@property (readonly, nonatomic) NSUInteger redWinesCount;
@property (readonly, nonatomic) NSUInteger whiteWinesCount;
@property (readonly, nonatomic) NSUInteger otherWinesCount;

-(VOSWineModel *) redWineAtIndex:(NSUInteger) index;
-(VOSWineModel *) whiteWineAtIndex:(NSUInteger) index;
-(VOSWineModel *) otherWineAtIndex:(NSUInteger) index;

@end
