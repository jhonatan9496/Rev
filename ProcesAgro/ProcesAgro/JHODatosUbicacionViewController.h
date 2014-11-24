//
//  JHODatosUbicacionViewController.h
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 30/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHODatosUbicacionViewController : UIViewController{
    
    IBOutlet UITextField *municipio;
    IBOutlet UITextField *departamento;
    
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


- (IBAction)salirMunicipio:(id)sender;
- (IBAction)salirDepto:(id)sender;

@end
