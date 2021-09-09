//
//  AppDelegate.h
//  HotCoffee_Objc
//
//  Created by 李明儒 on 2021/8/30.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

