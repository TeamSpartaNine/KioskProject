//
//  ViewController.swift
//  Kiosk
//
//  Created by A on 2023/12/27.
//

import UIKit

protocol Zoomable {
    func zoomIn()
    func zoomOut()
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let zoomButton = ZoomButton()
        
        view.addSubview(zoomButton)
        
        zoomButton.translatesAutoresizingMaskIntoConstraints = false
        zoomButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 36).isActive = true
        zoomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        zoomButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        zoomButton.heightAnchor.constraint(equalToConstant: 64).isActive = true
        zoomButton.backgroundColor = nil
        
    }

}
