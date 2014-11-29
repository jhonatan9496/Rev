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
    
   
    
    IBOutlet UITextField *nombreSolicitante;
    IBOutlet UITextField *cedulaSolicitante;
    IBOutlet UITextField *fijoSolicitante;
    IBOutlet UITextField *celularSolicitante;
    
    IBOutlet UITextField *nombreVereda;
    
    IBOutlet UIPickerView *departamentos;
    IBOutlet UIPickerView *municipios;
    
    NSMutableArray  *vectorDepartamentos;
    NSMutableArray  *vectorMunicipios;
    NSMutableArray  *vectorTmpMuni;
    NSMutableArray  *vectorTmpDeptos;
    
    
    NSString *selDep;
    NSString *selMun;
    
    
}

@property (strong, nonatomic) IBOutlet UIPickerView *departamentos;
@property (strong, nonatomic) IBOutlet UIPickerView *municipios;

@property (strong, nonatomic) IBOutlet  NSMutableArray *vectorDepartamentos;
@property (strong, nonatomic) IBOutlet  NSMutableArray  *vectorMunicipios;
@property (strong, nonatomic) IBOutlet  NSMutableArray  *vectorTmpMuni;
@property (strong, nonatomic) IBOutlet  NSMutableArray  *vectorTmpDeptos;

@property (strong, nonatomic) IBOutlet NSString *selDep;
@property (strong, nonatomic) IBOutlet  NSString *selMun;


- (IBAction)continuarIdentificar:(id)sender;

@end
