//
//  MojView.swift
//  domaci mojPuzzle///
//
//  Created by Vuk on 6/22/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class MojView: UIImageView {
    
        //var slicica: UIImageView?
        var lastLocation: CGPoint = CGPoint(x: 0,y: 0)
        override init(image: UIImage?) {
            super.init(image: image)
            let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(MojView.detectPan(_:)))
            self.addGestureRecognizer(panRecognizer)
            self.isUserInteractionEnabled = true
        }
    
        required init?(coder aDecoder: NSCoder) {
            fatalError("Nije implementiran koder")
        }
        
        func detectPan (_ recognizer: UIPanGestureRecognizer){
            let translation = recognizer.translation(in: self.superview!)
            print("Promena koordinata za \(translation.x), \(translation.y)")
            self.center = CGPoint(x: lastLocation.x + translation.x, y: lastLocation.y + translation.y)
        }
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.superview?.bringSubview(toFront: self)
            lastLocation = self.center
        }
        
}

