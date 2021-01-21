//
//  ContentView.swift
//  test
//
//  Created by tokumoto on 2020/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var userData: UserData
    @State var showDraft = false
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.bottom)
            
            VStack {
                VStack(spacing: 5) { //MARK: Top
                    
                    HStack {
                        Text("To do")
                            .fontWeight(.heavy)
                        
                        Spacer()
                        
                        Button(action: {//MARK: Delete button
                            
                            DeleteTask()
                            
                        }, label: {
                            
                            Text("Delete")
                            
                        })
                    }
                    .padding()
                    .font(.title)
                    
                    Button(action: { //MARK: Draft button
                        
                        self.showDraft.toggle()
                        
                    }, label: {
                        
                        Image(systemName:  "plus")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding()
                            .background(Circle().foregroundColor(.red))
                        
                    })
                    .padding(.bottom, -50)
                    .sheet(isPresented: $showDraft, content:{
                        Draft()
                    })
                }
                .padding()
                .background(Rounded().foregroundColor(.white))
                
                //MARK: Top END
                
                Spacer()
                
                ScrollView(.vertical, showsIndicators: false) {
                    ForEach(self.userData.tasks) { task in
                        
                        Button(action: {
                            
                            guard let index =  self.userData.tasks.firstIndex(of: task) else{
                                return
                            }
                            
                            self.userData.tasks[index].checked.toggle()
                            
                            
                        }, label: {
                            
                            ListRow(title: task.title, checked: task.checked)
                                .padding()
                                .foregroundColor(.black)
                        })
                        
                    }
                    .padding(.top, 30)
                }
            }
        }
    }
    
    func DeleteTask()  {
        
        let remainingTasks = self.userData.tasks.filter({!$0.checked})
        userData.tasks = remainingTasks
        
    }
}

struct Rounded: Shape {
    func path(in rect: CGRect) -> Path {
            
        let path = UIBezierPath(roundedRect: rect,byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 25, height: 25))
        
        return Path(path.cgPath)
    }
}


struct Task: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var checked : Bool
}


class UserData: ObservableObject {
    @Published var tasks = [ Task(title: "Hello1", checked: false),
                             Task(title: "Hello2", checked: false),
                             Task(title: "Hello3", checked: false),
                             Task(title: "Hello4", checked: false),
                             
    ]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserData())
    }
}
