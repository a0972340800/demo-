//
//  firstViewController.swift
//  demo!
//
//  Created by john john on 2017/4/20.
//  Copyright © 2017年 john john. All rights reserved.
//

import UIKit

class firstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 153/255, green: 230/255, blue: 77/255, alpha: 1)
        
        //時間延遲2秒
        Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(change), userInfo: nil, repeats: false)
        
    }
    func change() {
        self.present(customController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
