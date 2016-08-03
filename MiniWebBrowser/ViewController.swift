//
//  ViewController.swift
//  MiniWebBrowser
//
//  Created by Koby Samuel on 10/14/15.
//  Copyright © 2015 Koby Samuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var backButton: UIButton!
	@IBOutlet weak var forwardButton: UIButton!
	@IBOutlet weak var goButton: UIButton!
	@IBOutlet weak var webSiteChoice: UISegmentedControl!
	@IBOutlet weak var webViewView: UIWebView!
	@IBOutlet weak var urlBox: UITextField!
	
	@IBAction func pleaseGoBack(sender: AnyObject) {
		webViewView.goBack()
	}
	
	@IBAction func pleaseGoForward(sender: AnyObject) {
		webViewView.goForward()
	}
	@IBAction func toggleSpecialURLs(sender: AnyObject) {
		var urlList: [String: NSURL?] = ["Apple" : NSURL(string: "https://www.apple.com/")!, "Google" : NSURL(string: "https://www.google.com/")!, "Yahoo" : NSURL(string: "https://www.yahoo.com/")!, "DuckDuckGo" : NSURL(string: "https://www.duckduckgo.com/")!]
		let urlAsString: NSURL = urlList[webSiteChoice.titleForSegmentAtIndex(webSiteChoice.selectedSegmentIndex)!]!!
		webViewView.loadRequest(NSURLRequest(URL: urlAsString))
		urlBox.text = String(urlAsString)
	}
	
	@IBAction func goToURL(sender: AnyObject) {
		var urlStringForMeAsNSURL: NSURL = NSURL(string: urlBox.text!)!
		webViewView.loadRequest(NSURLRequest(URL: urlStringForMeAsNSURL))
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		webViewView.loadRequest(NSURLRequest(URL: NSURL(string: "https://www.google.com/")!))
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

