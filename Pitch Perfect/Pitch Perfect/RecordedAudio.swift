//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Tricia Short on 3/20/15.
//  Copyright (c) 2015 Tricia Short. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathURL: NSURL!
    var title: String!
    
    init(filePathURL: NSURL, title: String){
        self.filePathURL = filePathURL
        self.title = title
    }

}