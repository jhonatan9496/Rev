//
//  JHODatosFincaYPropietarioViewController.h
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 30/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHODatosFincaYPropietarioViewController : UIViewController <UITextFieldDelegate>{
    
    IBOutlet UITextField *ica3101;
    IBOutlet UITextField *nombreFinca;
    IBOutlet UITextField *nombrePropietario;
    IBOutlet UITextField *cedulaPropietario;
    IBOutlet UITextField *fijoPropietario;
    IBOutlet UITextField *celularPropietario;
    
    IBOutlet UIScrollView *scroller;
    
}

- (IBAction)celularEdita:(id)sender;
- (IBAction)terminaEditaCel:(id)sender;
- (IBAction)sitermina:(id)sender;

- (IBAction)avanzarDatosFinca:(id)sender;
@end
