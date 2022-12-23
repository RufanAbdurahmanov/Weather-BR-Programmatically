import UIKit

struct AnchorConstraints {
    var top : NSLayoutConstraint?
    var bottom : NSLayoutConstraint?
    var trailing : NSLayoutConstraint?
    var leading : NSLayoutConstraint?
    var width : NSLayoutConstraint?
    var height : NSLayoutConstraint?
    
}




extension UIView {
    @discardableResult
    func anchor(top : NSLayoutYAxisAnchor?,
                bottom : NSLayoutYAxisAnchor?,
                leading : NSLayoutXAxisAnchor?,
                trailing : NSLayoutXAxisAnchor?,
                padding : UIEdgeInsets = .zero,
                size : CGSize = .zero) -> AnchorConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        var aConstraint = AnchorConstraints()
        
        if let top = top {
            aConstraint.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let bottom = bottom {
            aConstraint.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
        }
        
        if let leading = leading {
            aConstraint.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        if let trailing = trailing {
            aConstraint.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            aConstraint.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            aConstraint.height = heightAnchor.constraint(equalToConstant: size.height)
        }
        
        [aConstraint.top,aConstraint.bottom,aConstraint.trailing,aConstraint.leading,aConstraint.width,aConstraint.height].forEach {$0?.isActive = true}
        
        return aConstraint
        
    }
    
    func fillSuperView(padding : UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let sTop = superview?.topAnchor {
            topAnchor.constraint(equalTo: sTop, constant: padding.top).isActive = true
        }
        
        if let sBottom = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: sBottom, constant: -padding.bottom).isActive = true
            
        }
        
        if let sLeading = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: sLeading, constant: padding.left).isActive = true
        }
        
        if let sTrailing = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: sTrailing, constant: -padding.right).isActive = true
        }
        
        
    }
    
    func centerPositioningSuperView(size : CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let centerX = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: centerX).isActive = true
        }
        
        if let centerY = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: centerY).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
    }
    
    func centerY(_ anchor : NSLayoutXAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: anchor).isActive = true
    }
    
    func centerX(_ anchor : NSLayoutYAxisAnchor) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: anchor).isActive = true
    }
    
    func centerXSuperView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let superViewCenterXanchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superViewCenterXanchor).isActive = true
        }
    }
    
    func centerYSuperView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let superViewCenterYanchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superViewCenterYanchor).isActive = true
        }
    }
    
    @discardableResult
    func constraintHeight(_ height : CGFloat) -> AnchorConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var cons = AnchorConstraints()

        cons.height = heightAnchor.constraint(equalToConstant: height)
        cons.height?.isActive = true
        return cons
    }
    
    @discardableResult
    func constraintWidth(_ width : CGFloat) -> AnchorConstraints {
        translatesAutoresizingMaskIntoConstraints = false
        var cons = AnchorConstraints()
        cons.width = heightAnchor.constraint(equalToConstant: width)
        cons.width?.isActive = true
        return cons
    }
    
  
    
    convenience init(backgroundColor : UIColor = .clear) {
        self.init(frame : .zero)
        self.backgroundColor = backgroundColor
    }
}

