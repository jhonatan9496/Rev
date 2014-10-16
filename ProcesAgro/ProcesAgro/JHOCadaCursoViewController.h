//
//  JHOCadaCursoViewController.h
//  ProcesAgro
//
//  Created by JHONATAN ACELAS AREVALO on 16/10/14.
//  Copyright (c) 2014 jhonatan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Social/Social.h>
#import <Accounts/Accounts.h>

@interface JHOCadaCursoViewController : UIViewController{
       SLComposeViewController *post;
    
    
}


//Retiene valores de la vista
@property (nonatomic, strong) NSString *textTituloCurso;
@property (nonatomic, strong) NSString *textDeescripcionCurso;
@property (nonatomic, strong) NSString *textLinkCurso;

@property (strong, nonatomic) IBOutlet UILabel *tituloCurso;
@property (strong, nonatomic) IBOutlet UILabel *descripcionCurso;
@property (strong, nonatomic) IBOutlet UIButton *linkCurso;
- (IBAction)linkWebCurso:(id)sender;

- (IBAction)postFace:(id)sender;
- (IBAction)postTwit:(id)sender;
@end
