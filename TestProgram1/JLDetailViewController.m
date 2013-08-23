//
//  JLDetailViewController.m
//  TestProgram1
//
//  Created by Student on 08.08.13.
//  Copyright (c) 2013 Student. All rights reserved.
//

#import "JLDetailViewController.h"
#import <MapKit/MapKit.h>
#import "PointAnnotation.h"

@interface JLDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *userTweetTextView;
@property (nonatomic, weak) IBOutlet MKMapView *mapView;

@end

@implementation JLDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.mapView addAnnotation:[[PointAnnotation alloc] init]];
    self.userTweetTextView.text = self.userTweetText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation isKindOfClass:[PointAnnotation class]]) {
        static NSString *identifier = @"Annotation";
        MKAnnotationView *view = [mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        if (!view) {
            view = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier];
            view.canShowCallout = YES;
        } else {
            view.annotation = annotation;
        }
        return view;
    }
    return nil;
}

@end