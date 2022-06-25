//
//  SettingsView.swift
//  Notes WatchKit Extension
//
//  Created by hakkı can şengönül on 25.06.2022.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    @AppStorage("lineCount") var lineCount : Int = 1
    @State private var value : Float = 1.0
    
    // MARK: - FUNCTION
    
    func update(){
        lineCount = Int(value)
    }
    
    // MARK: - BODY
    var body: some View {
        VStack( spacing: 10) {
            //HEADER
            HeaderView(title: "Settings")
            //ACTUAL LINE COUNT
            Text("Lines: \(lineCount)".uppercased()).bold()
            //SLIDER
            Slider(value: Binding(get: {
                self.value
            }, set: { newValue in
                self.value = newValue
                self.update()
            }), in: 1...4,step: 1)
            .foregroundColor(.accentColor)
        }
    }
}

// MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
