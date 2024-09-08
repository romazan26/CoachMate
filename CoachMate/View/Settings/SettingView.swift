//
//  SettingView.swift
//  CoachMate
//
//  Created by Роман on 08.09.2024.
//

import SwiftUI
import StoreKit

struct SettingView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var isPresentShare = false
    @State private var isPresentPolicy = false
    @State var urlShare = "https://www.apple.com/app-store/"
    
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack{
                //MARK: - Toolbar
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .frame(width: 15, height: 20)
                            .foregroundStyle(.white)
                    }
                    Spacer()
                    Text("Settings")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .heavy))
                        
                    Spacer()
                    
                    Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 21, height: 21)
                        .foregroundStyle(.white)
                    
                }.padding()
                
                Spacer()
                //MARK: - Share App Button
                Button(action: {isPresentShare.toggle()}, label: {
                    SettingButton(text: "SHARE APP", imageName: "square.and.arrow.up")
                })
                
                
                //MARK: - Rate App Button
                Button {
                    SKStoreReviewController.requestReview()
                } label: {
                    SettingButton(text: "RATE APP", imageName: "star.fill")
                }
                
                //MARK: - Privacy button
                Button(action: {isPresentPolicy.toggle()}, label: {
                    SettingButton(text: "PRIVACY POLICY", imageName: "line.diagonal.arrow")
                })
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isPresentShare, content: {
            ShareSheet(items: urlShare )
        })
        .sheet(isPresented: $isPresentPolicy, content: {
            WebViewPage(urlString: URL(string: "https://google.com")!)
        })
    }
}

struct ShareSheet: UIViewControllerRepresentable{
    var items: String
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let av = UIActivityViewController(activityItems: [items], applicationActivities: nil)
        return av
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}


#Preview {
    SettingView()
}
