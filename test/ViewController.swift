//
//  ViewController.swift
//  test
//
//  Created by naver on 2016. 10. 4..
//  Copyright © 2016년 naver. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnResize: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        imgOn = UIImage(named: "girls.jpg")
        imgOff = UIImage(named: "test.png")
        
        imgView.image = imgOn
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func btnResizeImage(sender: UIButton) {
        let scale:CGFloat = 1.2
        var newWidth:CGFloat, newHeight:CGFloat
        
        if (isZoom) {
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            //imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            imgView.frame = CGRectMake(
                imgView.frame.origin.x,
                imgView.frame.origin.y, newWidth, newHeight);
            
            btnResize.setTitle("확대", forState: .Normal)
            
        } else {
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            imgView.frame.size = CGSize(width: newWidth, height: newHeight)
            btnResize.setTitle("축소", forState: .Normal)
        }
        isZoom = !isZoom
    }
    @IBAction func switchImageOnOff(sender: UISwitch) {
        if sender.on {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
}

