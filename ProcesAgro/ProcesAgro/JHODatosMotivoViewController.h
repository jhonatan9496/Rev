//
//  JHODatosMotivoViewController.h
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 30/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHODatosMotivoViewController : UIViewController{
    
    
    IBOutlet UITextField *primeraVez;
    IBOutlet UITextField *nacimiento;
    IBOutlet UITextField *compra;
    IBOutlet UITextField *perdidaDIN;
    
}

- (IBAction)begin:(id)sender;
- (IBAction)salirdin:(id)sender;

- (IBAction)salirCompra:(id)sender;
- (IBAction)salirNacimiento:(id)sender;
- (IBAction)salirprimer:(id)sender;

@end
