//
//  ViewController.swift
//  DownloadingWebContent
//
//  Created by Vishwa Raj on 01/11/16.
//  Copyright © 2016 innov8. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let url = URL(string: "https://stackoverflow.com/")
        {
//            myWebView.loadRequest(URLRequest(url:url))
            let request = NSMutableURLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request as URLRequest)
            {
            data, response, error in
            
                if error != nil
                {
                    print(error)
                }
                else
                {
                      if let unwrappedData = data
                      {
                        let dataString = NSString(data : unwrappedData, encoding : String.Encoding.utf8.rawValue)
                        
                        print(dataString)
                        
                        DispatchQueue.main.sync(execute: {
                             self.myWebView.loadHTMLString(String(dataString!  ), baseURL: nil)
                        })
                    }
                }
                
            }
            task.resume()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

