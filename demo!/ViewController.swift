//
//  ViewController.swift
//  demo!
//
//  Created by john john on 2017/4/18.
//  Copyright © 2017年 john john. All rights reserved.
//

import UIKit
import Social

var menuOpen = false

//產生navBar給ViewController
let customController = UINavigationController(rootViewController: ViewController())

class ViewController: UIViewController {
    
    

    var adj = ["熱熱的","廢廢的","冷冷的","鬱鬱的","藍藍的","悶悶的","厭世的"]
    var day = ["今天","午後","夜晚","時刻","片刻"]
    var feeling = ["灑脫","慵懶","任性","狂妄"]
    var stuff = ["珍珠","布丁","仙草","","波霸","文青","懷舊"]
    var drink = ["紅茶","綠茶","烏龍","青茶","冬瓜","可可"]
    var milk = ["拿鐵","","拿鐵"]
    var image: UIImage?
    var sometime: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "文。青茶館"
        
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(openMenu))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(shareToFriends))
        
        let r = random()
        let g = random()
        let b = random()
        
        var drinks = ["西北風","\(stuff[number(Ary: stuff)])\(drink[number(Ary: drink)])\(milk[number(Ary: milk)])"]
        sometime = day[number(Ary: day)]
        let timing = "\(adj[number(Ary: adj)])\(sometime!)"

        self.view.backgroundColor = UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
        
        self.view.addSubview(firstNameLabel)
        self.view.addSubview(secondNameLabel)
        self.view.addSubview(thirdNameLabel)
        
//        self.view.addSubview(sideView)
        
        setupFirstNameLabel()
        setupSecondNameLabel()
        setupThirdNameLabel()
        
//        setupSideView()
        
        firstNameLabel.text = timing
        secondNameLabel.text = timing == "廢廢的下午" ? "適合品味一杯\(drinks[0])" : "適合品味一杯\(drinks[1])"
        thirdNameLabel.text = "來自我\(self.sometime!)的\(self.feeling[Int(arc4random()) % self.feeling.count])"
       
        animate(label: firstNameLabel, duration: 2.0)
        animate(label: secondNameLabel, duration: 4.0)
        animate(label: thirdNameLabel, duration: 6.0)

    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.addSubview(sideView)
        sideView.isHidden = true
        setupSideView()
        
    }
    
    
    //makes a animation of label
    func animate(label: UILabel, duration: CFTimeInterval) {
        let animation = CABasicAnimation(keyPath: "opacity")
            animation.fromValue = 0.0
            animation.toValue = 1.0
            animation.duration = duration
        label.layer.add(animation, forKey: "Image-opacity")
    }
    
    
    
    func shareToFriends() {
        let actionSheet = UIAlertController(title: "Share your style", message: "趕快跟朋友分享吧！", preferredStyle: .actionSheet)
        let btn1 = UIAlertAction(title: "Share To FaceBook", style: .default) { (btn1) in
            let shareToFaceBook: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            shareToFaceBook.setInitialText("\(self.firstNameLabel.text!)\n\(self.secondNameLabel.text!)\n\t\t\t\t---\(self.thirdNameLabel.text!)")
            self.image = self.captureScreen()
            shareToFaceBook.add(self.image)
            self.present(shareToFaceBook, animated: true, completion: nil)
        }
        let btn2 = UIAlertAction(title: "Share To Twitter", style: .default) { (btn2) in
            let shareToTwitter: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            self.present(shareToTwitter, animated: true, completion: nil)
        }
        let btn3 = UIAlertAction(title: "Cancel", style: .default) { (bt3) in
            
        }
        actionSheet.addAction(btn1)
        actionSheet.addAction(btn2)
        actionSheet.addAction(btn3)
        present(actionSheet, animated: true) { 
            
        }
        
    }
    
    //螢幕截圖
    func captureScreen() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, UIScreen.main.scale)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let Image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return Image
    }
    
    func openMenu() {
        
        
        
        UIView.animate(withDuration: 0.3, animations: {
            self.sideView.isHidden = false
                self.sideView.frame.origin.x = (menuOpen) ? -150 : 0
            })
        
        menuOpen = !menuOpen
    }
    
    let sideView: UIView = {
        let sv = UIView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = UIColor.init(white: 0.98, alpha: 1)
        sv.layer.opacity = 1
        sv.layer.shadowOpacity = 0.7
        return sv
    }()
    
    func setupSideView() {
        sideView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        sideView.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        sideView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        sideView.rightAnchor.constraint(equalTo: view.leftAnchor, constant: -10).isActive = true
    }
    
    func setupFirstNameLabel() {
        
        firstNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        firstNameLabel.heightAnchor.constraint(equalToConstant: 350).isActive = true
        firstNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 65).isActive = true
        firstNameLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func setupSecondNameLabel() {
        
        secondNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
        secondNameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        secondNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondNameLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func number(Ary: [String]) -> Int {
        let n = Int(arc4random())
        let i = n % Ary.count
        return i
    }
    
    let firstNameLabel: UILabel = {
        let nl = UILabel()
        nl.lineBreakMode = NSLineBreakMode.byCharWrapping
        nl.numberOfLines = 0
        nl.translatesAutoresizingMaskIntoConstraints = false
        nl.font = UIFont.systemFont(ofSize: 32)
        nl.textColor = UIColor.white
        return nl
        
    }()
    
    let secondNameLabel: UILabel = {
        let nl = UILabel()
        nl.lineBreakMode = NSLineBreakMode.byCharWrapping
        nl.numberOfLines = 0
        nl.translatesAutoresizingMaskIntoConstraints = false
        nl.font = UIFont.systemFont(ofSize: 32)
        nl.textColor = UIColor.white
        return nl
        
    }()
    
    let thirdNameLabel: UILabel = {
        let nl = UILabel()
        nl.lineBreakMode = NSLineBreakMode.byCharWrapping
        nl.numberOfLines = 0
        nl.translatesAutoresizingMaskIntoConstraints = false
        nl.font = UIFont.systemFont(ofSize: 25)
        nl.textColor = UIColor.white
        return nl
        
    }()
    
    func setupThirdNameLabel() {
        
        thirdNameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80).isActive = true
        thirdNameLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        thirdNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -65).isActive = true
        thirdNameLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    
    func random() -> CGFloat {
        let randomNumber:CGFloat = CGFloat(arc4random() % 56 + 120)
        return randomNumber
    }
    
    let mainImageView: UIImageView = {
        let mv = UIImageView()
        mv.translatesAutoresizingMaskIntoConstraints = false
        mv.image = UIImage(named: "background")
        return mv
    }()

}


