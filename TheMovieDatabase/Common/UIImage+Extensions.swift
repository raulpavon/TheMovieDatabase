//
//  UIImage+Extensions.swift
//  TheMovieDatabase
//
//  Created by Raúl Leonardo Pavón Toral on 09/12/21.
//

import Foundation
import UIKit

extension UIImage {
    class func getImageFromURL(imageString: String) -> UIImage? {
        if let urlImage = URL(string: "\(GlobalConstants.TheMovieDatabase.posterImageURL)\(imageString)") {
            let data = try? Data(contentsOf: urlImage)
            if let imageData = data {
                return UIImage(data: imageData) ?? UIImage()
            }
        }
        return nil
    }
}
