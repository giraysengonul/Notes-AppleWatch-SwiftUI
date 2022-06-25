//
//  DetailView.swift
//  Notes WatchKit Extension
//
//  Created by hakkı can şengönül on 25.06.2022.
//

import SwiftUI

struct DetailView: View {
    // MARK: - PROPERTIES
    let note : Note
    let count : Int
    let index : Int
    
    @State private var isCreditsPresented : Bool = false
    @State private var isSettingsPresented : Bool = false
    // MARK: - FUNCTION
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            
            //HEADER
            HeaderView(title: "")
            
            //Context
            Spacer()
            ScrollView(.vertical, showsIndicators: false) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }
            Spacer()
            //FOOTER
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented) {
                        SettingsView()
                    }
                Spacer()
                Text("\(count) / \(index + 1)")
                Spacer()
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresented.toggle()
                    }
                    .sheet(isPresented: $isCreditsPresented) {
                        CreditsView()
                    }
            }//HStack
            .foregroundColor(.secondary)
            
        }//:VStack
        .padding(5)
    }
}



// MARK: - PREVIEW
struct DetailView_Previews: PreviewProvider {
    static var sampleData : Note = Note(id: UUID(), text: "Hello, hakki")
    static var previews: some View {
        DetailView(note: sampleData, count: 5, index: 1)
    }
}
