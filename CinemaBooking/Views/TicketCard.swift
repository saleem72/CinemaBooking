//
//  TicketCard.swift
//  CinemaBooking
//
//  Created by Yousef on 6/8/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct TicketCard: View {
    let ticket: Ticket
    var coloredBorder: Bool
    var onDrag: () -> Void
    
    init(ticket: Ticket, coloredBorder: Bool, onDrag: @escaping () -> Void) {
        self.ticket = ticket
        self.coloredBorder = coloredBorder
        self.onDrag = onDrag
    }

    
    @State private var barcode: UIImage?
    @State private var offset: CGFloat = 0
    
    var body: some View {
        WebImage(url: ticket.movie.imageHighResURL)
            .resizable()
            .placeholder {
                Image(Asset.man)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.top)
                    .frame(maxHeight: .infinity, alignment: .top)
            }
            .indicator(.activity)
            .transition(.fade(duration: 0.5))
            .frame(width: coloredBorder ? 250 : 225, height: coloredBorder ? 460 : 414)
            .clipped()
            .overlay(barcodeSection(), alignment: .bottom)
            .clipShape(TicketShape())
            .background(borderLayer)
            .offset(x: offset)
            .onAppear(perform: generateBarcode)
            .gesture(dragGuesture())
    }
    
    func generateBarcode() {
        let barCodeData = "\(ticket.selectedDate.longDate), \(ticket.selectedTime.label), seats:\(ticket.selectedSeatsNumbers)"
        
        
        barcode = BarcodeGenerator.generateBarCode(from: barCodeData, descriptor: .code128)
    }
    
}

extension TicketCard {
    
    private func dragChanged(_ value: DragGesture.Value) {
        guard coloredBorder else { return }
        
        let temp = value.translation.width * 0.6
        DispatchQueue.main.async {
            offset = temp
        }
    }
    
    private func dragEnd(_ value: DragGesture.Value) {
        
        guard coloredBorder else { return }
        
        let temp = value.translation.width * 0.6
        if abs(temp) > 100 {
            offset = temp * 10
            onDrag()
            offset = 0
        } else {
            offset = 0
        }
    }
    
    private func dragGuesture() -> some Gesture {
        DragGesture()
            .onChanged(dragChanged)
            .onEnded(dragEnd)
    }
    
    private var borderLayer: some View {
        Group {
            if coloredBorder {
                TicketShape()
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.theme.green,
                                Color.theme.green.opacity(0),
                                Color.theme.green.opacity(0)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing)
                        ,
                        lineWidth: 4
                    )
            } else {
                TicketShape()
                    .stroke(Color.white.opacity(0.3), lineWidth: 4)
            }
        }
    }
    
    @ViewBuilder
    private func barcodeSection() -> some View {
        if coloredBorder {
        ZStack(alignment: .top) {
                
            LineShape()
                .stroke(Color.black.opacity(0.6), style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [7], dashPhase: 0.2))
                .frame(height: 1)
            
            VStack {
                HStack(spacing: 7) {
                    HStack(spacing: 7) {
                        Text("Date:")
                            .font(.body)
//                            .customFont()
                            .foregroundColor(Color(hex: "56147A"))
                            .lineLimit(1)
                            .minimumScaleFactor(0.6)
                        Text(ticket.selectedDate.mediumDate)
//                            .customFont(.footnote)
                            .lineLimit(1)
                            .minimumScaleFactor(0.4)
                    }
                    
                    Spacer(minLength: 0)
                    HStack(spacing: 7) {
                        Text("Time:")
                            .font(.body)
//                            .customFont()
                            .foregroundColor(Color(hex: "56147A"))
                            .lineLimit(1)
                            .minimumScaleFactor(0.6)
                        Text(ticket.selectedTime.label)
                            .lineLimit(1)
                            .minimumScaleFactor(0.4)
                    }
                }
                .font(.footnote)
                
                HStack(spacing: 8) {
                    Text("Row:")
                        .foregroundColor(Color(hex: "56147A"))
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                    Text(ticket.selectedSeats.first?.rowName ?? "")
                        .customFont(.footnote)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                    
                    Spacer(minLength: 0)
                    Text("Seats:")
                        .foregroundColor(Color(hex: "56147A"))
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                    Text(ticket.selectedSeatsNumbers)
                        .customFont(.footnote)
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                }
                .lineLimit(1)
                .minimumScaleFactor(0.6)
                
                Spacer(minLength: 0)
                
                if let barcode = barcode {
                    Image(uiImage: barcode)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
//                        .frame(maxWidth: .infinity)
                    
                        .scaleEffect(x: 1.0, y: 2, anchor: .center)
                    
                    Spacer(minLength: 0)
                }
            }
            .frame(maxHeight: 132)
            .padding(.horizontal, 32)
            .padding(.top, 12)
            .background(Color.white.opacity(0.6))
            .background(BlurView(style: .systemThinMaterialDark))
        }
        } else {
            EmptyView()
        }
    }
}

struct TicketCard_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            
            LinearGradient(
                gradient: Gradient(colors: [
                    Color.theme.blue,
                    Color.theme.background
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            .overlay(
                ZStack {
                    Circle()
                        .fill(Color(hex: "FF53C0").opacity(0.4))
                        .frame(width: 300, height: 300)
                        .offset(x: UIScreen.main.bounds.width * 0.5 - 75, y: 0)
                        .blur(radius: 100)
                    
                    Circle()
                        .fill(Color(hex: "60FFCA").opacity(0.4))
                        .frame(width: 300, height: 300)
                        .offset(x: 0, y: -150)
                        .blur(radius: 100)
                }
            )
            
            TicketCard(ticket: Ticket.example, coloredBorder: true) { }
        }
    }
}
