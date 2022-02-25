//
//  EditBookView.swift
//  Bookworm
//
//  Created by Thomas Cowern New on 2/25/22.
//

import SwiftUI

struct EditBookView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            Text("Edit Book View")
            Button {
                dismiss()
            } label: {
                Text("Close")
            }

        }
        
    }
}

struct EditBookView_Previews: PreviewProvider {
    static var previews: some View {
        EditBookView()
    }
}
