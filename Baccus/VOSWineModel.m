//
//  VOSWineModel.m
//  Baccus
//
//  Created by Vicente Oliva de la Serna on 23/12/14.
//  Copyright (c) 2014 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSWineModel.h"

@implementation VOSWineModel

#pragma mark - Class Methods
+(id) wineWithName: (NSString *) aName
  wineCompanyName: (NSString *) aWineCompanyName
             type: (NSString *) aType
           origin: ( NSString *) anOrigin
           grapes: (NSArray *) arrayOfGrapes
   wineCompanyWeb: (NSURL *) aURL
            notes: (NSString *) aNotes
           rating: (int) aRating
            photo:(UIImage *) aPhoto{
    
    return [[self alloc] initWithName:aName
                      wineCompanyName:aWineCompanyName
                                 type:aType
                               origin:anOrigin
                               grapes:arrayOfGrapes
                       wineCompanyWeb:aURL
                                notes:aNotes
                               rating:aRating
                                photo:aPhoto];
    
}

+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: ( NSString *) anOrigin{
    
    return [[self alloc] initWithName:aName
                      wineCompanyName:aWineCompanyName
                                 type:aType
                               origin:anOrigin];
    
}


#pragma mark - Init
-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: ( NSString *) anOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aURL
             notes: (NSString *) aNotes
            rating: (int) aRating
             photo:(UIImage *) aPhoto{
    
    if (self = [super init]) {
        // Asignamos los parámetros a las variables de instancia
        _name = aName;
        _wineCompanyName = aWineCompanyName;
        _type = aType;
        _origin = anOrigin;
        _grapes = arrayOfGrapes;
        _wineCompanyWeb = aURL;
        _notes = aNotes;
        _rating =aRating;
        _photo =aPhoto;
    }
    return self;
}

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: ( NSString *) anOrigin{
    return [self initWithName:aName
              wineCompanyName:aWineCompanyName
                         type:aType
                       origin:anOrigin
                       grapes:nil
               wineCompanyWeb:nil
                        notes:nil
                       rating:NO_RATING
                        photo:nil];
    
}

@end
