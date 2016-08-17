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

#import "press_gfwAppDelegate.h"

extern int _start();

extern void _log(char *message);

extern int set_config(char *_server_host, char *_server_port, char *_password, char *_listen_port);

int main(int argc, char *argv[])
{
    
    /** signal(SIGPIPE, SIG_IGN); */
    
    @autoreleasepool {
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([press_gfwAppDelegate class]));
        
    }
    
}
