//
//  JHOViewController.h
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 9/07/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>

@interface JHOViewController : UIViewController{
    
    
    __weak IBOutlet UITextField *textFiltroBusqueda;
    IBOutlet UILabel *tituloConvocatoria;
    IBOutlet UILabel *descipcionLabelConvocatoria;
    AVAudioPlayer *audioPlayer;
    
}
// link buscar
- (IBAction)BuscarPrincipal:(id)sender;
//lanzar servicios
- (IBAction)servicio1:(id)sender;
- (IBAction)servicio2:(id)sender;
- (IBAction)servicio3:(id)sender;
- (IBAction)servicio4:(id)sender;
// lanzar TRamites
- (IBAction)oferta1:(id)sender;
- (IBAction)oferta2:(id)sender;
- (IBAction)oferta3:(id)sender;
- (IBAction)oferta4:(id)sender;


//Evento esconder teclado al oprimir done en el teclado
- (IBAction)buscarGeneralText:(id)sender;
//Evento actualizar la db
- (IBAction)actualizarDB:(id)sender;

- (IBAction)guardarFiltroBusqueda:(id)sender;


@end
