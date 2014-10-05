//
//  JHODatosBovinosViewController.h
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 30/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHODatosBovinosViewController : UIViewController{
    
    IBOutlet UITextField *menor1Bovinos;
    IBOutlet UITextField *entre12Bovinos;
    IBOutlet UITextField *entre23Bovinos;
    IBOutlet UITextField *mayores3Bovinos;
    
}

- (IBAction)begin:(id)sender;
- (IBAction)salir:(id)sender;

- (IBAction)salir23:(id)sender;
- (IBAction)salir12:(id)sender;
- (IBAction)salir1:(id)sender;

@end
