//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by hakkı can şengönül on 25.06.2022.
//

import SwiftUI

struct CreditsView: View {
    // MARK: - PROPERTIES
    @State private var randomImageNumber : Int = Int.random(in: 1..<4)
    private var randomImage :String {
        return "developer-no\(randomImageNumber)"
    }
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 5) {
            //PROFILE IMAGE
            Image(randomImage)
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            //HEADER
            HeaderView(title: "Credits")
            //CONTENT
            Text("Hakkı Can ŞENGÖNÜL")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }
    }
}


// MARK: - PREVIEW
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
