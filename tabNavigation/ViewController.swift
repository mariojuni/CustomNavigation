//
//  ViewController.swift
//  tabNavigation
//
//  Created by Mario Juni on 04/06/2019.
//  Copyright © 2019 Mario Juni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var navItems: [UIView]!
    @IBOutlet weak var bottomNav: UIView!
    @IBOutlet weak var navBar: UIView!
    let colors =  [UIColor(hex: 0x002058).cgColor,
                   UIColor(hex: 0x003399).cgColor,
                   UIColor(hex: 0x003399).cgColor]
    
    var navSelectedItem: (index:Int,constraints: NSLayoutConstraint, view: UIView)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in navItems.indices {
            let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
            navItems[index].layer.cornerRadius = navItems[index].bounds.size.width/2
            navItems[index].clipsToBounds = true
            navItems[index].isUserInteractionEnabled = true
            navItems[index].addGestureRecognizer(tap)
        }
    }
    
    override func viewDidLayoutSubviews() {
        bottomNav.applyGradient(colors: colors)
        navBar.applyGradient(colors: colors)
    }
    
    @objc func handleTap(sender: UITapGestureRecognizer? = nil) {
     
            if let (_ ,const,navView) = navSelectedItem{
                   const.constant = 0
                   navView.layer.sublayers?.remove(at: 0)
            }
        
        for subview in view.subviews {
            for constraint in subview.constraints {
                if sender?.view?.tag == 1 && constraint.identifier == "navItem1" {
                   
                    navSelectedItem = (1,constraint,sender?.view) as? (index: Int,constraints: NSLayoutConstraint, view: UIView)
                    if let (_ ,const,navView) = navSelectedItem {
                        const.constant = 20
                        navView.applyGradient(colors: colors)
                    }
                }
                if sender?.view?.tag == 2 && constraint.identifier == "navItem2" {
                    
                    navSelectedItem = (2,constraint,sender?.view) as? (index: Int,constraints: NSLayoutConstraint, view: UIView)
                    if let (_ ,const,navView) = navSelectedItem {
                        const.constant = 20
                        navView.applyGradient(colors: colors)
                    }
                }
                if sender?.view?.tag == 3 && constraint.identifier == "navItem3" {
                    
                    navSelectedItem = (3,constraint,sender?.view) as? (index: Int,constraints: NSLayoutConstraint, view: UIView)
                    if let (_ ,const,navView) = navSelectedItem {
                        const.constant = 20
                        navView.applyGradient(colors: colors)
                    }
                }
                if sender?.view?.tag == 4 && constraint.identifier == "navItem4" {
                    
                    navSelectedItem = (4,constraint,sender?.view) as? (index: Int,constraints: NSLayoutConstraint, view: UIView)
                    if let (_ ,const,navView) = navSelectedItem {
                        const.constant = 20
                        navView.applyGradient(colors: colors)
                    }
                }
            }
        }
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        }, completion: {finished in})
    }
}

extension UIView{
    func  applyGradient(colors: [CGColor] ) {
        let gradientColor = CAGradientLayer()
        gradientColor.colors = colors
        gradientColor.frame =  CGRect(origin: CGPoint.zero, size: self.frame.size)
        //set the stroke direction [right - left]
        gradientColor.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientColor.endPoint = CGPoint(x: 2.0, y: 1.0)
        self.layer.insertSublayer(gradientColor, at: 0)
    }
}
extension UIColor {
    public convenience init(hex: Int) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: 1)
    }
}

extension CGColor {
    public class func colorWithHex(hex: Int) -> CGColor {
        return UIColor(hex: hex).cgColor
    }
}
