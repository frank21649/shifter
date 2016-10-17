//
//  MSWeekViewDecoratorNewEvent.h
//  RVCalendarWeekView
//
//  Created by Badchoice on 1/9/16.
//  Copyright © 2016 revo. All rights reserved.
//

#import "MSWeekViewDecorator.h"

@protocol MSWeekViewNewEventDelegate <NSObject>

-(BOOL)weekView:(MSWeekView*)weekView canMoveEvent:(MSEvent*)event to:(NSDate*)date;
-(void)weekView:(MSWeekView*)weekView event:(MSEvent*)event moved:(NSDate*)date;
-(void)weekView:(MSWeekView*)weekView onLongPressAt:(NSDate*)date;
@end

@interface MSWeekViewDecoratorNewEvent : MSWeekViewDecorator

@property(weak,nonatomic) id<MSWeekViewNewEventDelegate> createEventDelegate;

+(__kindof MSWeekView*)makeWith:(MSWeekView*)weekView andDelegate:(id<MSWeekViewNewEventDelegate>)delegate;
@end
