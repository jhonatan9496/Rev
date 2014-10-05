//
//  JHODatosBufalinosViewController.h
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 30/08/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHODatosBufalinosViewController : UIViewController{
    
    IBOutlet UITextField *menor1Bufalino;
    IBOutlet UITextField *entre12Bufalino;
    IBOutlet UITextField *entre23Bufalino;
    IBOutlet UITextField *mayor3Bufalino;
    
}

- (IBAction)begin3:(id)sender;
- (IBAction)salir3:(id)sender;

- (IBAction)salir1:(id)sender;
- (IBAction)salir12:(id)sender;
- (IBAction)salir23:(id)sender;
@end
