//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by hakkı can şengönül on 24.06.2022.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @AppStorage("lineCount") var lineCount : Int = 1
    @State private var notes : [Note] = [Note]()
    @State private var text : String = ""
    // MARK: - FUNCTION
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    func save(){
        do{
            //1.JSOnEncoder
            let data  = try JSONEncoder().encode(notes)
            //2.create a new URL to save the file using the getDocumentDirectory
            let url = getDocumentDirectory().appendingPathComponent("notes")
            //3.write the data to the given URL
            try data.write(to: url)
        }catch{
            print("Saving data has failed!!")
        }
    }
    func load(){
        DispatchQueue.main.async {
            
            do{
                let url = getDocumentDirectory().appendingPathComponent("notes")
                let data = try Data(contentsOf: url)
                notes = try JSONDecoder().decode([Note].self, from: data)
            }catch{
                
            }
            
        }
    }
    func delete(offset:IndexSet){
        withAnimation {
            notes.remove(atOffsets: offset)
            save()
        }
    }
    // MARK: - BODY
    var body: some View {
        
        VStack{
            
            HStack(alignment: .center, spacing: 6) {
                TextField("Add New Note",text: $text)
                Button {
                    //1. only run the button's action when the text field is not emty
                    guard text.isEmpty == false else {
                        return
                    }
                    //2. create a new item
                    let note = Note(id: UUID(), text: text)
                    
                    //3. add the new note item to the notes array
                    notes.append(note)
                    //4. text field emty
                    text = ""
                    //5.save the notes(Function)
                    save()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42,weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(.plain)
                .foregroundColor(.accentColor)
                
                
            }
            Spacer()
            if notes.count >= 1 {
                List{
                    ForEach (0..<notes.count,id: \.self){i in
                        NavigationLink(destination : DetailView(note: notes[i], count: notes.count, index: i)) {
                            HStack{
                                Capsule()
                                    .frame(width:4)
                                    .foregroundColor(.accentColor)
                                Text(notes[i].text)
                                    .lineLimit(lineCount)
                                    .padding(.leading,5)
                            }
                        }
                        
                    }
                    .onDelete(perform: delete)
                }
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.3)
                    .padding(25)
                Spacer()
            }
        }
        .navigationTitle("Notes")
        .onAppear {
            load()
        }
        
        
        
    }
}


// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
