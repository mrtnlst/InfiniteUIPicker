//
//  ViewController.h
//  UIPickerTest
//
//  Created by martin on 22.10.17.
//  Copyright © 2017 martinlist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *itemPicker;

@end

