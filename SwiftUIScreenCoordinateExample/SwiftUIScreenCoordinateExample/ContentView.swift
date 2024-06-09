//
//  ContentView.swift
//  SwiftUIScreenCoordinateExample
//
//  Created by seungwoo on 2024/06/09.
//

import SwiftUI

struct ContentView: View {
    
    @State private var touchLocation: CGPoint = .zero;

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                Color.black.ignoresSafeArea()
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                self.touchLocation = value.location
                            }
                    )
                
                Rectangle()
                    .ignoresSafeArea()
                    .frame(width: proxy.size.width)
                    .frame(height: 4)
                    .position(x: proxy.size.width)
                    .position(y: touchLocation.y + proxy.size.height / 2)
                    .foregroundStyle(.cyan.opacity(0.5))
                Rectangle()
                    .ignoresSafeArea()
                    .frame(width: 4)
                    .frame(height: proxy.size.height)
                    .position(x: touchLocation.x + proxy.size.width / 2)
                    .position(y: proxy.size.height)
                    .foregroundStyle(.pink.opacity(0.5))
                
                
                GeometryReader { _ in
                    VStack {
                        Text("Max width: \(String(format: "%.2f", proxy.size.width))")
                        Text("Current X: \(String(format: "%.2f", touchLocation.x))")
                        Text("Max height: \(String(format: "%.2f", proxy.size.height))")
                        Text("Current Y: \(String(format: "%.2f", touchLocation.y))")
                    }
                    .padding()
                    .background(.gray.opacity(0.8))
                    .clipShape(RoundedRectangle(cornerRadius: 4))
                    .foregroundStyle(.white)
                    .font(.caption)
                    .gesture(
                        DragGesture(minimumDistance: 0)
                            .onChanged { value in
                                self.touchLocation = value.location
                            }
                    )
                }
            }

        }
    }
}

#Preview {
    ContentView()
}
