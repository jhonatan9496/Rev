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
    
    UITextField *currentTextField;
    BOOL keyboardIsShown;
    
}
@property(nonatomic,retain)UIScrollView *scroller;


- (IBAction)celularEdita:(id)sender;
- (IBAction)sitermina:(id)sender;


- (IBAction)beginTelefonoFijo:(id)sender;
- (IBAction)salirTelefonoFijo:(id)sender;


- (IBAction)salirCedula:(id)sender;


- (IBAction)salirNombrePropietario:(id)sender;


- (IBAction)salirNombreFinca:(id)sender;

- (IBAction)salirIca:(id)sender;

- (IBAction)avanzarDatosFinca:(id)sender;
@end
