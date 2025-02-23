//
//  SendView.swift
//  Drivers
//
//  Created by Diarmuid on 18/01/2025.
//

import SwiftUI

struct SendView: View {
    @StateObject var viewModel = SendViewViewModel()
    
    private let userid: String
    init(userid: String){
        self.userid = userid
    }
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle(Text("Send")
            )
            .ignoresSafeArea()
        }
        .padding(.top, -75)
    }
    struct SendView_Previews: PreviewProvider {
        static var previews: some View {
            SendView(userid: "")
        }
    }
}
