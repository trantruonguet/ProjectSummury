//
//  HeaderView.swift
//  ProjectSummury
//
//  Created by TruongTV-GD on 2/4/20.
//  Copyright © 2020 TruongTV-GD. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var openCamera: UIImageView!
    @IBOutlet weak var instagram: UILabel!
    @IBOutlet weak var send: UIImageView!
    
    var sendInstagram: (() -> ())?
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit () {
        Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        
        openCamera.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (openCameraAction)))
        
        instagram.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector (reloadHomePageAction) ))
        
        send.addGestureRecognizer(UITapGestureRecognizer (target: self, action: #selector (sendPostAction)))
        
    }
    
    @objc func openCameraAction () -> Void {
        
    }
    
    @objc func reloadHomePageAction () -> Void {
        
    }
    
    @objc func sendPostAction () -> Void {
        sendInstagram?()
    }
}
