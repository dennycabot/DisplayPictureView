//
//  DPView.swift
//  DisplayPictureView
//
//  Created by Denny Mathew on 21/02/17.
//  Copyright © 2017 Cabot Solutions. All rights reserved.
//

import UIKit

class DPView: UIView {
    
    //MARK:- Properties
    
    /* Base Properties */
    let nibName: String = "DPView"
    var view: UIView!
    
    /* Outlets */
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var channelView: UIImageView!
    @IBOutlet weak var badgeView: UIView!
    @IBOutlet weak var badgeLabel: UILabel!
    
    /* Designables */
    
    //Profile Image
    @IBInspectable var profileImage: UIImage?
    @IBInspectable var ProfileImageShape: ViewShape = .square
    @IBInspectable var primaryBGColor: UIColor = .white
    @IBInspectable var secondaryBGColor: UIColor = .white
    @IBInspectable var profileNameColor: UIColor = .orange
    @IBInspectable var profileNameFont: UIFont?
    //Badge View
    @IBInspectable var showBadge: Bool = false
    @IBInspectable var badgeShape: ViewShape = .square
    @IBInspectable var badgeBorderWidth: Float = 0.0
    @IBInspectable var badgeBorderColor: UIColor = .clear
    @IBInspectable var badgePrimaryBGColor: UIColor = .white
    @IBInspectable var badgeSecondaryBGColor: UIColor = .white
    @IBInspectable var badgeCount: Int = 0
    @IBInspectable var badgeCountColor = UIColor.red
    @IBInspectable var badgeCountFont: UIFont?
    @IBInspectable var badgeCountSize: Float?
    var badgePosition: ViewPosition  = .bottomRight
    
    //Channel View
    @IBInspectable var showChannel: Bool = false
    @IBInspectable var channelShape: ViewShape = .square
    @IBInspectable var channelBorderWidth: Float = 0.0
    @IBInspectable var channelBorderColor: UIColor = .clear
    var channelPosition: ViewPosition  = .topRight
    
    //MARK:- Initializers
    func setup() {
        self.view = UINib(nibName: self.nibName, bundle: Bundle(for: type(of: self))).instantiate(withOwner: self, options: nil)[0] as! UIView
        self.view.frame = bounds
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(self.view)
    }
    
    public func initWith(_ image: UIImage?, name: String?, shape: ViewShape) {
        
        /* Assign Image if Available */
        if (image != nil) {
            self.setProfileImage(with: self.profileImage!)
        }
            
            /* Set Profile Initials if Profile Image is not Available */
        else if (name != nil){
            setProfileInitials(with: name!)
            
        }
            
        else {
            fatalError("No Profile Image or Profile Name Available!")
        }
        
        /* Apply View Shape */
        setProfileImageShape(with: shape)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    /* Configure View with Properties */
    func setProfileImage(with image: UIImage)  {
        self.profileImage = image
        self.profileImageView.image = profileImage
    }
    
    /* Set Profile Initials if Profile Image is not Available */
    func setProfileInitials(with profileName: String) {
        
        let profileNameArr = profileName.components(separatedBy: " ")
        var initials = ""
        
        for name in profileNameArr {
            initials = initials + String(name.characters.first!)
        }
        
        self.profileNameLabel.text = initials
    }
    
    func setProfileImageShape(with shape: ViewShape) {
        self.profileImageView.layer.masksToBounds = false
        self.profileImageView.layer.cornerRadius = profileImageView.frame.size.height/2
        self.profileImageView.clipsToBounds = true
    }
}

