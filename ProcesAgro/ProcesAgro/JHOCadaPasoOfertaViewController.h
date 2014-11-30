//
//  JHOCadaPasoOfertaViewController.h
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 29/11/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JHOCadaPasoOfertaViewController : UIViewController{
    
}

//Retiene valores de la vista
@property (nonatomic, strong) NSString *textTituloPaso;
@property (nonatomic, strong) NSString *textDeescripcionPaso;


@property (strong, nonatomic) IBOutlet UILabel *tituloPasoOferta;
@property (strong, nonatomic) IBOutlet UITextView *descripcionPasoOferta;

@end
