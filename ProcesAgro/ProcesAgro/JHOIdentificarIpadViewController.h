//
//  JHOIdentificarIpadViewController.h
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 13/09/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHOIdentificarIpadViewController : UIViewController{
    IBOutlet UITextField *menor1Bovinos;
    IBOutlet UITextField *entre12Bovinos;
    IBOutlet UITextField *entre23Bovinos;
    IBOutlet UITextField *mayores3Bovinos;
    
    IBOutlet UITextField *menor1Bufalino;
    IBOutlet UITextField *entre12Bufalino;
    IBOutlet UITextField *entre23Bufalino;
    IBOutlet UITextField *mayor3Bufalino;
    
    IBOutlet UITextField *primeraVez;
    IBOutlet UITextField *nacimiento;
    IBOutlet UITextField *compra;
    IBOutlet UITextField *perdidaDIN;
}

@end
