//
//  ImageExtensions.swift
//  Pods
//
//  Created by Kevin Belter on 1/2/17.
//
//

import Foundation
import SDWebImage

extension UIImageView {
    func setImageWithURLAnimated(_ anURL:URL, completitionBlock:(() -> ())? = nil) {
        let image = UIImage(color: UIColor.gray)
        sd_setImage(with: anURL, placeholderImage: image, options: SDWebImageOptions()) { (_, _, _, _) in
            completitionBlock?()
        }
    }
}

extension UIImage {
    func resizeWith(width: CGFloat) -> UIImage? {
        let imageView = UIImageView(frame: CGRect(origin: .zero, size: CGSize(width: width, height: CGFloat(ceil(width/size.width * size.height)))))
        imageView.contentMode = .scaleAspectFit
        imageView.image = self
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        imageView.layer.render(in: context)
        guard let result = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        return result
    }
    
    var jpegRepresentation:Data? {
        return UIImageJPEGRepresentation(self, 0.8)
    }
    
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
}
