//
//  ViewController.swift
//  YouTub
//
//  Created by name 1 on 3/23/25.
//  Copyright © 2025 name 1. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Create the WKWebViewConfiguration
        let config = WKWebViewConfiguration()
        
        // Set up the WKWebView instance
        webView = WKWebView(frame: self.view.frame, configuration: config)
        webView.navigationDelegate = self
        
        // Add the webView to the view
        self.view.addSubview(webView)
        
        // Load the URL
        if let url = NSURL(string: "https://m.youtube.com") {
            let request = NSURLRequest(URL: url)
            webView.loadRequest(request)
        }
    }

    // MARK: - WKNavigationDelegate Methods

    // If the webpage fails to load
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        print("Failed to load: \(error.localizedDescription)")
    }

    // Handle navigation requests, if necessary
    func webView(webView: WKWebView, decidePolicyForNavigationAction navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.Allow)
    }

    // MARK: - Handle Orientation Changes

    // Override this method to adjust the frame when the orientation changes
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        // Update the webView's frame to match the new size
        coordinator.animateAlongsideTransition({ (context) in
            self.webView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        }, completion: nil)
    }
}
