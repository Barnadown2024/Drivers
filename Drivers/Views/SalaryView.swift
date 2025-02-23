//
//  SalaryView.swift
//  Drivers
//
//  Created by Diarmuid on 18/01/2025.
//

import SwiftUI

struct SalaryView: View {
    @StateObject var viewModel = SalaryViewViewModel()
    
    private let userid: String
    init(userid: String){
        self.userid = userid
    }
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle(Text("Gross Wages Calculation"))
        }
        .padding(.top, -75)
    }
    struct SalaryView_Previews: PreviewProvider {
        static var previews: some View {
            SalaryView(userid: "")
        }
    }
}
