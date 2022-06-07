//
//  BarcodeGenerator.swift
//  CinemaBooking
//
//  Created by Yousef on 6/6/22.
//

import Foundation
import UIKit
import CoreImage.CIFilterBuiltins

enum BarcodeGenerator {
    
    enum Descriptor: String {
        case code128 = "CICode128BarcodeGenerator"
        case pdf417 = "CIPDF417BarcodeGenerator"
        case aztec = "CIAztecCodeGenerator"
        case qr = "CIQRCodeGenerator"
    }
    
    /*
     func generateBarcode(from string: String) -> UIImage {
         let data = Data(string.utf8)
         filter.setValue(data, forKey: "inputMessage")
         if let outputImage = filter.outputImage {
             if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                 return UIImage(cgImage: cgImage)
             }
         }
         
         return UIImage(systemName: "xmark.circle") ?? UIImage()
     }
     */
    
    static func generateBarCode(from string: String, descriptor: Descriptor) -> UIImage {
        let data = string.data(using: String.Encoding.ascii)

        if let filter = CIFilter(name: descriptor.rawValue) {
            filter.setValue(data, forKey: "inputMessage")
            
            
            if let outputImage = filter.outputImage {
                let context = CIContext()
                let rect = outputImage.extent
                let newRect = CGRect(
                    x: rect.minX,
                    y: rect.minY,
                    width: rect.width * (48 / rect.height),
                    height: 48
                )
                print(#function)
                print("rect: \(rect)")
                print("newRect: \(newRect)")
                if let cgImage = context.createCGImage(outputImage, from: newRect) {
                    return UIImage(cgImage: cgImage)
                }
            }
            
        }

        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}
