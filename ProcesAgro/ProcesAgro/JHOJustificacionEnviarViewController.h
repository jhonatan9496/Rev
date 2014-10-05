//
//  JHOJustificacionEnviarViewController.h
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 30/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHOJustificacionEnviarViewController : UIViewController{
    
    IBOutlet UITextField *justificacion;
    
}

- (IBAction)enviarTramiteFinal:(id)sender;
- (IBAction)salirJusti:(id)sender;
@end
