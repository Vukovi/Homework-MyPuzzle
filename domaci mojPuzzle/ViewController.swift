//
//  ViewController.swift
//  domaci mojPuzzle
//
//  Created by Vuk on 6/22/16.
//  Copyright © 2016 User. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let teodosic = UIImage(named: "TEODOSIC.jpg")
    var slikeSlagalice = [UIImage]()
    //var slikeSlagalice = [CGImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iseciSliku(teodosic!, kolone: 4, redovi: 3)
        kreirajSveObjekte()
    }

    func iseciSliku (_ slika: UIImage, kolone: CGFloat, redovi: CGFloat) -> UIImage {
       
        var slikaSlagalice = CGImage?()
        var slicicaSlagalice = UIImage?()
        let sirinaSlike = slika.size.width
        let visinaSlike = slika.size.height
        let sirinaCelije = sirinaSlike / kolone
        let visinaCelije = visinaSlike / redovi
        let celija: CGFloat?
        if sirinaCelije <= visinaCelije {
            celija = sirinaCelije
        }
        else {
            celija = visinaCelije
        }
        
        
        for i in 0...Int(kolone)-1{
            for j in 0...Int(redovi)-1{
                let kvadrat = CGRect(x: CGFloat(i) * celija!, y: CGFloat(j) * celija!, width: celija!, height: celija!)
                slikaSlagalice = slika.cgImage.cropping(to: kvadrat)
                slicicaSlagalice = UIImage(cgImage: slikaSlagalice!)
                slikeSlagalice.append(slicicaSlagalice!)
                //slikeSlagalice.append(slikaSlagalice!)
                
            }
            
        }
        print(slikeSlagalice)
        return slicicaSlagalice!
    }
    
    
    let sirinaObjekta = 50
    
    func kreirajSveObjekte(){
        
        //sada ovim hocemo da smestimo sve kvadrate u prostor ekrana pomocu sledece f-je:
        let insetSize = self.view.bounds.insetBy(dx: CGFloat(Int(sirinaObjekta)), dy: CGFloat(Int(sirinaObjekta))).size
        
        
        for i in 0...slikeSlagalice.count-1{
            
            let pointX = CGFloat(UInt(arc4random() % UInt32(UInt(insetSize.width))))
            let pointY = CGFloat(UInt(arc4random() % UInt32(UInt(insetSize.height))))
            let noviFrejm = CGRect(x: pointX, y: pointY, width: CGFloat(sirinaObjekta), height: CGFloat(sirinaObjekta))
            let slika = slikeSlagalice[i]
            let novaSlika = MojView(image: slika)
            novaSlika.frame = noviFrejm
            novaSlika.contentMode = UIViewContentMode.scaleAspectFit
            
            view.addSubview(novaSlika)
          
        }
    }

}

