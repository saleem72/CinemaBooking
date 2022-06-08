//
//  MobileTicketsScreen.swift
//  CinemaBooking
//
//  Created by Yousef on 6/5/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MobileTicketsScreen: View {
    @EnvironmentObject private var session: SessionManager
    @Environment(\.presentationMode) private var presentationMode
    @ObservedObject private var viewModel: ReservationViewModel
    @State private var barcode: UIImage?
    init(viewModel: ReservationViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            backgroundLayer
            
            VStack {
                header
                descriptionMessage
                    .padding(.bottom, 30)
                
                ZStack {
                    
                    WebImage(url: viewModel.movie.imageHighResURL)
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
                        .frame(width: 250, height: 460)
                        .clipped()
                        .overlay(barcodeSection, alignment: .bottom)
                        .clipShape(TicketShape())
                        .background(
                            TicketShape()
                                
                                    .stroke(
                                        LinearGradient(
                                            gradient: Gradient(colors: [
                                                Color.theme.green,
                                                Color.theme.green.opacity(0),
                                                Color.theme.green.opacity(0)
                                            ]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing),
                                        lineWidth: 4
                                )
                        )
                }
                
                Spacer()
            }
        }
        .navigationBarHidden(true)
        .onAppear {
            barcode = viewModel.generateBarcode()
        }
    }
}

extension MobileTicketsScreen {
    
    private var barcodeSection: some View {
        ZStack(alignment: .top) {
                
            LineShape()
                .stroke(Color.black.opacity(0.6), style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round, dash: [7], dashPhase: 0.2))
                .frame(height: 1)
            
            VStack {
                HStack(spacing: 8) {
                    Text("Date:")
                        .font(Font.gallery.semiBold(13))
                        .foregroundColor(Color(hex: "56147A"))
                    Text(viewModel.selectedDate.mediumDate)
                        .font(Font.gallery.regular(13))
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                    
                    Spacer(minLength: 0)
                    Text("Time:")
                        .font(Font.gallery.semiBold(13))
                        .foregroundColor(Color(hex: "56147A"))
                    Text(viewModel.selectedTime.label)
                        .font(Font.gallery.regular(13))
                        .lineLimit(1)
                        .minimumScaleFactor(0.4)
                }
                .lineLimit(1)
                .minimumScaleFactor(0.6)
                
                HStack(spacing: 8) {
                    Text("Row:")
                        .font(Font.gallery.semiBold(13))
                        .foregroundColor(Color(hex: "56147A"))
                    Text(viewModel.theatre.selectedSeats.first?.rowName ?? "")
                        .font(Font.gallery.regular(13))
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
                    
                    Spacer(minLength: 0)
                    Text("Seats:")
                        .font(Font.gallery.semiBold(13))
                        .foregroundColor(Color(hex: "56147A"))
                    Text(viewModel.theatre.selectedSeatsNumbers)
                        .font(Font.gallery.regular(13))
                        .lineLimit(1)
                        .minimumScaleFactor(0.6)
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
            .background(BlurView(style: .systemUltraThinMaterialLight))
        }
    }
    
    private var descriptionMessage: some View {
        Text("Once you buy a movie ticket simply scan the barcode to acces to your movie.")
            .customFont()
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 72)
    }
    
    private var header: some View {
        HStack {
            Button(action: {
                session.goBackHome()
            }, label: {
                Image(systemName: "arrow.backward")
                    .headerButton()
            })
            
            Spacer()
            
            Button(action: {}, label: {
                Image(Asset.menu)
                    .headerButton()
            })
        }
        .overlay(
            Text("Mobile Ticket")
                .customFont(.title3)
                .foregroundColor(.white)
        )
        .padding()
    }
    
    private var backgroundLayer: some View {
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
    }
}

struct MobileTicketsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MobileTicketsScreen(viewModel: ReservationViewModel.init(movie: .example))
            .environmentObject(SessionManager())
    }
}


