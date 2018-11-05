//
//  ViewController.swift
//  ChangeFont
//
//  Created by ＴＩＮＧＹＵ on 2018/11/5.
//  Copyright © 2018年 ＴＩＮＧＹＵ. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let label = UILabel()
    var dynamicFontName = "Savoye LET"
    var dynamicFamilyName = "Telugu Sangam MN"
    let familyNames = UIFont.familyNames

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        label.text = "Hello Swift, this is change font test"
        label.textAlignment = NSTextAlignment.center
        self.view.addSubview(label)
        label.snp.makeConstraints{ (make) in
            make.top.equalTo(100)
            make.centerX.equalTo(self.view)
        }
        label.font = UIFont.systemFont(ofSize: 30)
        
        let changebtn = UIButton(type: .custom)
        changebtn.setTitle("change font family", for: .normal)
        changebtn.addTarget(self, action: #selector(changeFontFamily), for: .touchUpInside)
        changebtn.setTitleColor(.blue, for: .normal)
        self.view.addSubview(changebtn)
        changebtn.layer.borderColor = UIColor.blue.cgColor
        changebtn.layer.borderWidth = 1
        changebtn.layer.cornerRadius = 5
        changebtn.snp.makeConstraints{(make) in
            make.top.equalTo(500)
            make.centerX.equalTo(self.view)
            make.width.equalTo(200)
        }
        
        
        
        //printAllSupportFontNames()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func changeFontFamily() {
        label.font = UIFont(name: dynamicFontName, size: 30)
        
        let familyIndex = familyNames.count>0 ? Int.random(in: 0...(familyNames.count-1)) :0
        dynamicFamilyName = familyNames[familyIndex]
        
        var fontsNames = UIFont.fontNames(forFamilyName: dynamicFamilyName)
        let fontsIndex = fontsNames.count > 0 ? Int.random(in: 0...(fontsNames.count-1)) : 0
        dynamicFontName = fontsNames[fontsIndex]
        
        print("familyName is \(dynamicFamilyName)")
        print("dynamicFontName is \(dynamicFontName)")
        print("-----------------")
    }
    
    func printAllSupportFontNames(){
       
        for familyName in familyNames{
            print("+++++ \(familyName)")
            let fontsNames = UIFont.fontNames(forFamilyName: familyName)
            for fontName in familyNames{
                print("----- \(fontName)")
            }
        }
        
    }

}

