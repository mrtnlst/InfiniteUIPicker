//
//  ViewController.m
//  UIPickerTest
//
//  Created by martin on 22.10.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import "ViewController.h"

#define PICKER_ROW_MULTIPLIER 10

@interface ViewController () {
    NSMutableArray *pickerData;
    NSMutableArray *pickerSource;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Initialize Data
    pickerSource = [NSMutableArray arrayWithObjects:@"Item 1", @"Item 2", @"Item 3", @"Item 4", @"Item 5", @"Item 6", nil];
    pickerData = [NSMutableArray arrayWithArray:pickerSource];

    // Fill pickerData depending on PICKER_ROW_MULTIPLIER.
    for (int i = 0; i < PICKER_ROW_MULTIPLIER; i++) {
         [pickerData addObjectsFromArray:pickerSource];
    }
    
    // Connect data
    self.itemPicker.dataSource = self;
    self.itemPicker.delegate = self;
    
    // Initial selected row is in the middle.
    [self.itemPicker selectRow:(PICKER_ROW_MULTIPLIER * pickerSource.count / 2) inComponent:0 animated:NO];
}

// The number of columns of data.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data.
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return pickerData.count;
}

// The data to return for the row and component (column) that's being passed in.
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return pickerData[row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    // When user gets to the last row.
    if (row == pickerData.count - 1) {
        
        // SOLUTION 1: Adding new objects to picker.
        for (int i = 0; i < PICKER_ROW_MULTIPLIER; i++) {
            [pickerData addObjectsFromArray:pickerSource];
        }
        
        // SOLUTION 2: Resetting selected row to middle.
//        [self.itemPicker selectRow:(PICKER_ROW_MULTIPLIER * pickerSource.count / 2) inComponent:0 animated:NO];
        [pickerView reloadAllComponents];
        NSLog(@"Count: %lu", pickerData.count);
    }
    
    // When user gets to the first row.
    if (row == 0) {
        [self.itemPicker selectRow:(PICKER_ROW_MULTIPLIER * pickerSource.count / 2) inComponent:0 animated:NO];
        [pickerView reloadAllComponents];
        NSLog(@"Count: %lu", pickerData.count);
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
