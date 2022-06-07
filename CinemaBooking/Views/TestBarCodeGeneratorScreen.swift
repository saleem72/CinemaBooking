//
//  TestBarCodeGeneratorScreen.swift
//  CinemaBooking
//
//  Created by Yousef on 6/6/22.
//

import SwiftUI

struct TestBarCodeGeneratorScreen: View {
    
    @State private var uiImage: UIImage = UIImage(systemName: "photo.fill") ?? .init()
    
    let context = CIContext()
    let filter = CIFilter.barcodeGenerator()
    
    init() {
        
    }
    
    var body: some View {
        VStack {
            Text("Hello, World!")
                .font(Font.gallery.regular(13))
            
            Image(uiImage: uiImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
//                .frame(width: 300, height: 80)
            
        }
        .onAppear {
//            uiImage = generateBarcode(from: "hi there")
            uiImage = BarcodeGenerator.generateBarCode(from: "hi there", descriptor: .code128)
        }
    }
    
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
}

struct TestBarCodeGeneratorScreen_Previews: PreviewProvider {
    static var previews: some View {
        TestBarCodeGeneratorScreen()
    }
}
