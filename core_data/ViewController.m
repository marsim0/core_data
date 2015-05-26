//
//  ViewController.m
//  core_data
//
//  Created by Мариам Б. on 24.05.15.
//  Copyright (c) 2015 Мариам Б. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "PersonTableViewCell.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray * arrayName;
@property (nonatomic, strong) NSMutableArray * arrayAge;
@property (nonatomic, strong) NSMutableArray * arrayNumber;
@property (nonatomic, strong) UIImage * image;
@property (nonatomic, strong) DetailViewController * detail;
- (IBAction)newNoteAction:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView_People;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //инициализируем массивы
    self.arrayName = [[NSMutableArray alloc]init];
    self.arrayAge = [[NSMutableArray alloc]init];
    self.arrayNumber = [[NSMutableArray alloc]init];
    
    //инициализируем вьюконтроллер с идентификатором
    self.detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated {
    
    //извлекаем текстовые данные из кордата и добавляем в массивы
    CoreData * core = [CoreData new];
    self.arrayName = [core getNameData:@"Person" Key:@"name"];
    self.arrayAge = [core getAgeData:@"Person" Key:@"age"];
    self.arrayNumber = [core getNumberData:@"Person" Key:@"number"];
    
    //извлекаем картинку из кордата
    NSData * data = [core getImageData:@"Person" Key:@"image"];
    self.image = [UIImage imageWithData:data];
    
    //перезагрузка таблицы
    [self reloadTableView];
}

//метод перезагрузки таблицы
- (void) reloadTableView {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView_People reloadData];
    });
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.detail.isNew = NO;
    self.detail.valueName = [self.arrayName objectAtIndex:indexPath.row];
    self.detail.valueAge = [self.arrayAge objectAtIndex:indexPath.row];
    self.detail.valueNumber = [self.arrayNumber objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:self.detail animated:YES];
}

#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.arrayName.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
   PersonTableViewCell * cellPerson = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cellPerson.cellLabel_Name.text = [self.arrayName objectAtIndex:indexPath.row];
    cellPerson.cellLabel_Age.text = [self.arrayAge objectAtIndex:indexPath.row];
    cellPerson.cellLabel_PhoneNumber.text = [self.arrayNumber objectAtIndex:indexPath.row];
    cellPerson.cellImageView.image = self.image;
    
    return cellPerson;
    
}

//добавление новой записи по нажатию кнопки
- (IBAction)newNoteAction:(id)sender {
    self.detail = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    self.detail.isNew = YES;
    [self.navigationController pushViewController:self.detail animated:YES];
}
@end
