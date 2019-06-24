//
//  ViewController.swift
//  Tab Bar Controller
//
//  Created by Denis Bystruev on 24/06/2019.
//  Copyright © 2019 Denis Bystruev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    func message(_ message: String = "", line: Int = #line, function: String = #function) {
        print(Date(), line, function, "\(message) \(title ?? "nil")")
    }

    override func viewDidLoad() {
        message()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        message("+\t")
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        message("+\t")
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        message("-\t")
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        message("-\t")
        super.viewDidDisappear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        message("\(view.bounds.size)")
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        message("\(view.bounds.size)")
        super.viewDidLayoutSubviews()
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let colors = [#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1), #colorLiteral(red: 0.9994240403, green: 0.9855536819, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 1), #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1), #colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1)]
        
        let action = sender.titleLabel?.text ?? "nil"
        guard let tabBarController = tabBarController else { return }
        let count = tabBarController.viewControllers?.count ?? 0
    
        switch action {
            
        case "+":
            let viewController = ViewController()
            viewController.tabBarItem.badgeValue = "\(count + 1)"
            viewController.title = "View Controller #\(count + 1)"
            viewController.view.backgroundColor = colors[count % colors.count]
            tabBarController.viewControllers?.append(viewController)
            
        case "-":
            guard 1 < count else { return }
            tabBarController.viewControllers?.removeLast()
            
        default:
            break
        }
    }
    
}

