//
//  Draft.swift
//  test
//
//  Created by tokumoto on 2020/12/24.
//

import SwiftUI

struct Draft: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var userData: UserData
    @State var newTask = ""
    
    var body: some View {
        TextField("to do", text: $newTask, onCommit : {
            
            self.createTask()
            self.presentationMode.wrappedValue.dismiss()
            
        })
            .padding()
            .font(.title)
    }
    
    
    func createTask() {
        let new = Task(title: newTask, checked: false)
        self.userData.tasks.insert(new, at: 0)
    }
}

struct Draft_Previews: PreviewProvider {
    static var previews: some View {
        Draft()
    }
}
