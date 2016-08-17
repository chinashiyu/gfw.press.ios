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

#import "press_gfwViewController.h"

extern void _log(char * message);

extern int _start();

extern int _stop();

extern void _log(char *message);

extern int set_config(char *_server_host, char *_server_port, char *_password, char *_listen_port);

@implementation press_gfwViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    _log("GFW.Press客户端开始运行......");
    
    NSUserDefaults *config = [NSUserDefaults standardUserDefaults];
    
    NSString *_status_switch = [config objectForKey:@"gfw.press.StatusSwitch"];
    
    NSString *_server_host = [config objectForKey:@"gfw.press.ServerHost"];
    
    NSString *_server_port = [config objectForKey:@"gfw.press.ServerPort"];
    
    NSString *_password = [config objectForKey:@"gfw.press.Password"];
    
    NSString *_listen_port = [config objectForKey:@"gfw.press.ProxyPort"];
        
    self.ServerHostField.text = _server_host;
    
    self.ServerPortField.text = _server_port;
    
    self.PasswordField.text= _password;
    
    if ([_listen_port isEqualToString:@""]) {
        
        _listen_port = @"3128";
        
        [config setObject:@"3128" forKey:@"gfw.press.ProxyPort"];
        
        [config synchronize];
        
    }
    
    self.ProxyPortField.text = _listen_port;
    
    if ([_status_switch isEqualToString:@"YES"]) {
        
        self.StatusSwitch.on = YES;
        
    }
    
    if (set_config( (char *)[_server_host UTF8String], (char *) [_server_port UTF8String], (char *) [_password UTF8String], (char *) [_listen_port UTF8String]) != -1) {

        if (self.StatusSwitch.on) {
        
            _start();
            
            self.ServerHostField.enabled = NO;
            
            self.ServerPortField.enabled = NO;
            
            self.PasswordField.enabled = NO;
            
            self.ProxyPortField.enabled = NO;
            
        } 
        
    } else {
    
        self.StatusSwitch.on = NO;
    
    }

}

- (void)didReceiveMemoryWarning
{
    
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.ServerHostField endEditing:YES];
    
    [self.ServerPortField endEditing:YES];
    
    [self.PasswordField endEditing:YES];
    
    [self.ProxyPortField endEditing:YES];
    
}

- (IBAction)StatusSwitchAction:(id)sender {
    
    UISwitch *StatusSwitch = (UISwitch*)sender;
    
    NSUserDefaults *config = [NSUserDefaults standardUserDefaults];
    
    if (StatusSwitch.on) {
        
        _log("开关打开");
        
        [config setObject:@"YES" forKey:@"gfw.press.StatusSwitch"];
                
        [config setObject:self.ServerHostField.text forKey:@"gfw.press.ServerHost"];
        
        [config setObject:self.ServerPortField.text forKey:@"gfw.press.ServerPort"];
        
        [config setObject:self.PasswordField.text forKey:@"gfw.press.Password"];
        
        [config setObject:self.ProxyPortField.text forKey:@"gfw.press.ProxyPort"];
        
        [config synchronize];
        
        NSString *_server_host = [config objectForKey:@"gfw.press.ServerHost"];
        
        NSString *_server_port = [config objectForKey:@"gfw.press.ServerPort"];
        
        NSString *_password = [config objectForKey:@"gfw.press.Password"];
        
        NSString *_listen_port = [config objectForKey:@"gfw.press.ProxyPort"];
        
        if (set_config( (char *)[_server_host UTF8String], (char *) [_server_port UTF8String], (char *) [_password UTF8String], (char *) [_listen_port UTF8String]) != -1) {
            
            _start();
            
            self.ServerHostField.enabled = NO;
            
            self.ServerPortField.enabled = NO;
            
            self.PasswordField.enabled = NO;
            
            self.ProxyPortField.enabled = NO;
            
        } else {
            
            [config setObject:@"NO" forKey:@"gfw.press.StatusSwitch"];
            
            [config synchronize];
            
            self.StatusSwitch.on = NO;
            
            self.ServerHostField.enabled = YES;
            
            self.ServerPortField.enabled = YES;
            
            self.PasswordField.enabled = YES;
            
            self.ProxyPortField.enabled = YES;
            
        }
        
    } else {
        
         _log("开关关闭");

        _stop();
        
        [config setObject:@"NO" forKey:@"gfw.press.StatusSwitch"];
        
        [config synchronize];
        
        self.ServerHostField.enabled = YES;
        
        self.ServerPortField.enabled = YES;
        
        self.PasswordField.enabled = YES;
        
        self.ProxyPortField.enabled = YES;
        
    }
    
}

@end


