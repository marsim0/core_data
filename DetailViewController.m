//
//  DetailViewController.m
//  core_data
//
//  Created by Мариам Б. on 24.05.15.
//  Copyright (c) 2015 Мариам Б. All rights reserved.
//

#import "DetailViewController.h"
#import "CoreData.h"
#import "PersonTableViewCell.h"



@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField_addName;
@property (weak, nonatomic) IBOutlet UITextField *textField_addAge;
@property (weak, nonatomic) IBOutlet UITextField *textField_addNumber;
- (IBAction)action_SaveImage:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *button_SaveImage;
- (IBAction)button_backAction:(id)sender;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //присваиваем картинку ImageView
    self.imageView_Detail.image = [UIImage imageNamed:@"icon"];
    
    //если просматриваем детали записи, то редактировать в текстовом поле нельзя
    if (!self.isNew) {
        self.textField_addName.text = self.valueName;
        self.textField_addAge.text = self.valueAge;
        self.textField_addNumber.text = self.valueNumber;
        
        self.textField_addName.userInteractionEnabled = NO;
        self.textField_addAge.userInteractionEnabled = NO;
        self.textField_addNumber.userInteractionEnabled = NO;
        self.button_SaveImage.alpha = 0;
        
    } else {
       
    
    }
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}


//по нажатию return сохраняем текстовые данные
- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    CoreData * core = [CoreData new];
    if (textField.tag == 10 ) {
        [core saveData:@"Person" Value:textField.text For_Key:@"name"];
    } else if (textField.tag == 20 ) {
        [core saveData:@"Person" Value:textField.text For_Key:@"age"];
    } else if (textField.tag == 30) {
        [core saveData:@"Person" Value:textField.text For_Key:@"number"];
    }
    
    return YES;
    
}
//____________________________________________________________(это так, эксперименты)
//- (void)textFieldDidEndEditing:(UITextField *)textField {
//    CoreData * core = [CoreData new];
//    if ([textField isEqual:self.textField_addName] ) {
//        [core saveData:@"Person" Value:textField.text For_Key:@"name"];
//    } else if ([textField isEqual:self.textField_addAge] ) {
//        [core saveData:@"Person" Value:textField.text For_Key:@"age"];
//    } else if ([textField isEqual:self.textField_addNumber]) {
//        [core saveData:@"Person" Value:textField.text For_Key:@"number"];
//    }}
//__________________________________________________________________

//сохранение картинки по нажатию кнопки
- (IBAction)action_SaveImage:(id)sender {

    NSData * imageData = UIImagePNGRepresentation(self.imageView_Detail.image);
    CoreData * core = [CoreData new];
    [core saveImageData:@"Person" Value:imageData For_Key:@"image"];
    
}

//действие для кнопки назад
- (IBAction)button_backAction:(id)sender {
    if (self.textField_addName.text.length == 0 ||
        self.textField_addAge.text.length == 0 ||
        self.textField_addNumber.text.length == 0) {
        //если одно из полей пустое, то выскакивает предупреждение
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Предупреждение" message:@"Вы не заполнили все поля" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}


@end
