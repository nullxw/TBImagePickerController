//
// TBImagePickerController.m
//
// Copyright 2013 Tobias Bayer
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "TBImagePickerController.h"

@interface TBImagePickerController () <UIActionSheetDelegate>

@end

@implementation TBImagePickerController

- (void)viewDidAppear:(BOOL)animated {
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:NSLocalizedStringWithDefaultValue(@"TBImagePickerControllerSelectSource", nil, [NSBundle mainBundle], @"Select source", nil) delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:NSLocalizedStringWithDefaultValue(@"TBImagePickerControllerSelectionCamera", nil, [NSBundle mainBundle], @"Camera", nil), NSLocalizedStringWithDefaultValue(@"TBImagePickerControllerSelectionLibrary", nil, [NSBundle mainBundle], @"Library", nil), nil];
        
        [actionSheet showInView:self.view];
    } else {
        self.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if(buttonIndex == 0) {
        self.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        self.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
}

@end
