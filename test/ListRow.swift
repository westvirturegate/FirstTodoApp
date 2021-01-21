//
//  ListRow.swift
//  test
//
//  Created by tokumoto on 2020/12/24.
//

import SwiftUI

struct ListRow: View {
    
    let title : String
    var checked: Bool
    
    var body: some View {
        
        HStack {
            Text(checked ? "☑︎" : "□")
            
            Spacer()
            
            if checked {
                
                Text(title)
                    .strikethrough()
                    .fontWeight(.ultraLight)
                
            }else{
                
                Text(title)
                
            }
        }
        .font(.title)
        .padding()
        .background(Capsule().foregroundColor(.white))
            
    }
}

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        ListRow(title: "hello", checked: false)
    }
}
