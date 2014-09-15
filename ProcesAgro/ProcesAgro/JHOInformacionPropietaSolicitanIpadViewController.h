//
//  JHOInformacionPropietaSolicitanIpadViewController.h
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 13/09/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHOInformacionPropietaSolicitanIpadViewController : UIViewController{
    
    IBOutlet UITextField *ica3101;
    IBOutlet UITextField *nombreFinca;
    IBOutlet UITextField *nombrePropietario;
    IBOutlet UITextField *cedulaPropietario;
    IBOutlet UITextField *fijoPropietario;
    IBOutlet UITextField *celularPropietario;
    
    IBOutlet UITextField *municipio;
    IBOutlet UITextField *departamento;
    
    IBOutlet UITextField *nombreSolicitante;
    IBOutlet UITextField *cedulaSolicitante;
    IBOutlet UITextField *fijoSolicitante;
    IBOutlet UITextField *celularSolicitante;
    
}
- (IBAction)continuarIdentificar:(id)sender;

@end
