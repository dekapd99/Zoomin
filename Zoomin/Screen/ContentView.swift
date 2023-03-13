//
//  ContentView.swift
//  Zoomin
//
//  Created by Deka Primatio on 12/03/23.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    
    @State private var isAnimating:Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    
    // MARK: - FUNCTION
    // Reset Image Scale & Offset setelah di double klik kembali
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    // MARK: - CONTENT
    
    var body: some View {
        NavigationView {
            ZStack {
                // MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height)
                    .scaleEffect(imageScale)
                
                // MARK: - 1, Tap Gesture
                // Jika di Tap 2x, maka akan zoom sebesar 5x dan jika tidak maka kembali ke posisi zoom 1x
                    .onTapGesture(count: 2 , perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    })
                
                // MARK: - 2, Drag Gesture
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 2)) {
                                    imageOffset = value.translation
                                }
                            }
                            .onEnded { _ in
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )
            } //: ZStack
            .navigationTitle("Start Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 2)) {
                    isAnimating = true
                }
            })
        } //: NAVIGATION
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
