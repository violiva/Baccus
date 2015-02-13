//
//  VOSWineModel.m
//  Baccus
//
//  Created by Vicente Oliva de la Serna on 23/12/14.
//  Copyright (c) 2014 Vicente Oliva de la Serna. All rights reserved.
//

#import "VOSWineModel.h"

@implementation VOSWineModel

// Cuando creas una propiedad de sólo lectura e implementas un getter personalizado,
// como estamos haciendo con photo, el compilador da por hecho que no vas a necesitar
// una variable de instancia. En este caso no es así, y sí que necesito la variable,
// así que hay que obligarle a que la incluya. Esto se hace con la línea del @synthesize,
// con la que le indicamos que queremos una propiedad llamada photo con una variable
// de instancia llamada _photo.
// en la inmensa mayoría de los casos esto es opcional.
// Para más información: http://www.cocoaosx.com/2012/12/04/auto-synthesize-property-reglas-excepciones/

@synthesize photo = _photo;

#pragma mark - Properties
-(UIImage *) photo{
    // esto va a bloquear y se debería hacer en segundo plano.
    
    // hacemos una carga perezosa ( Lazy load ), es decir, sólo carga la imagen si hace falta.
    if ( _photo == nil ){
        _photo = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.photoURL ]];
    }
    return _photo;
}

#pragma mark - Class Methods
+(id) wineWithName: (NSString *) aName
  wineCompanyName: (NSString *) aWineCompanyName
             type: (NSString *) aType
           origin: ( NSString *) anOrigin
           grapes: (NSArray *) arrayOfGrapes
   wineCompanyWeb: (NSURL *) aURL
            notes: (NSString *) aNotes
           rating: (int) aRating
            photoURL:(NSURL *) aPhotoURL{
    
    return [[self alloc] initWithName:aName
                      wineCompanyName:aWineCompanyName
                                 type:aType
                               origin:anOrigin
                               grapes:arrayOfGrapes
                       wineCompanyWeb:aURL
                                notes:aNotes
                               rating:aRating
                                photoURL:aPhotoURL];
    
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
             photoURL:(NSURL *)aPhotoURL{
    
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
        _photoURL = aPhotoURL;
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
                        photoURL:nil];
    
}


#pragma mark - JSON
-(id)initWithDictionary:(NSDictionary *)aDict{
    return [self initWithName:[aDict objectForKey:@"name"]
              wineCompanyName:[aDict objectForKey:@"company"]
                         type:[aDict objectForKey:@"type"]
                       origin:[aDict objectForKey:@"origin"]
                       grapes:[self extractGrapesFromJSONArray:[aDict objectForKey:@"grapes"]]
//               wineCompanyWeb:[aDict objectForKey:@"wine_web"]
               wineCompanyWeb:[NSURL URLWithString:[aDict objectForKey:@"wine_web"]]
                        notes:[aDict objectForKey:@"notes"]
                       rating:[[aDict objectForKey:@"rating"] intValue]
                     photoURL:[NSURL URLWithString:[aDict objectForKey:@"picture"]]];
}

-(NSDictionary *)proxyForJSON{
    return @{@"name"            : self.name,
             @"company"         : self.wineCompanyName,
             @"wine_web"        : self.wineCompanyWeb,
             @"type"            : self.type,
             @"origin"          : self.origin,
             @"grapes"          : self.grapes,
             @"notes"           : self.notes,
             @"rating"          : @(self.rating),
             @"picture"         : [self.photoURL path]
             };
}

#pragma mark - Utils
-(NSArray *)extractGrapesFromJSONArray:(NSArray *) JSONArray{
    NSMutableArray * grapes = [NSMutableArray arrayWithCapacity:[JSONArray count]];
    
    for ( NSDictionary *dict in JSONArray){
        [grapes addObject:[dict objectForKey:@"grape"]];
    }
    return grapes;
}

-(NSArray *)packGrapesIntoJSONArray{
    NSMutableArray * jsonArray = [NSMutableArray arrayWithCapacity:[self.grapes count]];
    
    for ( NSString *grape in self.grapes){
        [jsonArray addObject:@{@"grape" : grape}];
    }
    return jsonArray;
}


@end
