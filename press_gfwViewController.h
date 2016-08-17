/**
 *
 *    GFW.Press
 *    Copyright (C) 2016  chinashiyu ( chinashiyu@gfw.press ; http://gfw.press )
 *
 *    This program is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    This program is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *    
 **/

#import <UIKit/UIKit.h>

@interface press_gfwViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *StatusSwitch;
@property (weak, nonatomic) IBOutlet UITextField *ServerHostField;
@property (weak, nonatomic) IBOutlet UITextField *ServerPortField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordField;
@property (weak, nonatomic) IBOutlet UITextField *ProxyPortField;

-(IBAction)StatusSwitchAction:(id)sender;

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end
