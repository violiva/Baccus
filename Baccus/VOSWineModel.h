//
//  VOSWineModel.h
//  Baccus
//
//  Created by Vicente Oliva de la Serna on 23/12/14.
//  Copyright (c) 2014 Vicente Oliva de la Serna. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define NO_RATING -1

@interface VOSWineModel : NSObject

@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) UIImage *photo;
@property (strong, nonatomic) NSURL *wineCompanyWeb;
@property (strong, nonatomic) NSString *notes;
@property (strong, nonatomic) NSString *origin;
@property (nonatomic) int rating;   // Nota entre 0 y 5
@property (strong, nonatomic) NSArray *grapes;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *wineCompanyName;

// Métodos de clase
+(id) wineWithName: (NSString *) aName
  wineCompanyName: (NSString *) aWineCompanyName
             type: (NSString *) aType
           origin: ( NSString *) anOrigin
           grapes: (NSArray *) arrayOfGrapes
   wineCompanyWeb: (NSURL *) aURL
            notes: (NSString *) aNotes
           rating: (int) aRating
            photo:(UIImage *) aPhoto;

+(id) wineWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: ( NSString *) anOrigin;



// Métodos de Instancia
// Comenzando por los inicializadores. Primero el designado y luego los de conveniencia
-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: ( NSString *) anOrigin
            grapes: (NSArray *) arrayOfGrapes
    wineCompanyWeb: (NSURL *) aURL
             notes: (NSString *) aNotes
            rating: (int) aRating
             photo:(UIImage *) aPhoto;

-(id) initWithName: (NSString *) aName
   wineCompanyName: (NSString *) aWineCompanyName
              type: (NSString *) aType
            origin: ( NSString *) anOrigin;

@end
