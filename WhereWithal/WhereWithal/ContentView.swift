//
//  ContentView.swift
//  WhereWithal
//
//  Created by Indhu on 09/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showHomeView = false
    let tabSpace = "            "
    var body: some View {
        NavigationView {
            VStack {
                Image("piggy")
                    .resizable()
                    .cornerRadius(15)
                    .aspectRatio(contentMode: .fit)
                    .padding(.all)
                Text("Welcome ...")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Text(tabSpace)
                Text("  Among many, you have taken the first step towards personal finance, hope you will have a great experience and congrats!")
                    .font(.caption)
                Text(tabSpace)
                Text(tabSpace)
                Button(action: { showHomeView = true }) {
                    Text("Get started")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: 100)
                        .padding(.all,20)
                        .background(LinearGradient(gradient: Gradient(colors: [.green, .green]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(20)
                }
                NavigationLink(destination: HomePageView(), isActive: $showHomeView) { }
            }
        }
    }
    
}

#Preview {
    ContentView()
}
