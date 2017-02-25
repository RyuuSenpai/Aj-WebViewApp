//
//  ViewController.swift
//  Ajman DED
//
//  Created by killvak on 1/8/17.
//  Copyright © 2017 killvak. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIWebViewDelegate {

    @IBOutlet weak var pageTitle: UILabel!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var reloadBtnOL: UIButton!
    @IBOutlet weak var backBtnOL: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.squareLoading.backgroundColor = UIColor(red: 255/255, green: 254/255, blue: 224/255, alpha: 1)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.  http://ajmanded.ae/Default.aspx
       // self.view.squareLoading.start(0.0)
        let url = URL(string: "http://ajmanded.ae/Default.aspx")
        if let url = url {
        let request = URLRequest(url: url  )
        webView.loadRequest(request)
        }
    }


 
 
    @IBAction func refreshBtnAct(_ sender: UIButton) {
        webView.reload()
    }
    @IBAction func backbtnAct(_ sender: UIButton) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        print("started Loading")
        self.buttonVisibility(bool: webView.canGoBack)
        self.view.squareLoading.start(0.0)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        print("finished loading")
       
        self.buttonVisibility(bool: webView.canGoBack)
        self.pageTitle.text = webView.stringByEvaluatingJavaScript(from: "document.title")
        self.view.squareLoading.stop(0.0)
    }

    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        print("failed")
    }
    
    func buttonVisibility(bool : Bool) {
        
        if bool {
            self.backBtnOL.isHidden = false

        }else {
            self.backBtnOL.isHidden = true
        }
        self.reloadBtnOL.isHidden = false

    }

    
    
}

