//
//  ContentView.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI

struct SourceOfFund: View {
    
    @State private var sourceNavigation : String? = nil
    @State private var funds = [Fund]()
    @State private var selectedFund : Fund = Fund()
    @State private var isActiove : Int? = nil

    private func loadData() {
        
        guard let data = JsonReader.loadDataFrom(filename: "Fund") else{
            return
        }
        print("masuk")
        do{
            self.funds = try JSONDecoder().decode([Fund].self, from: data)
            
            print(funds[0])
        }catch{
            print(error)
            return
        }
        
    }
    var body: some View {
        NavigationView{
            VStack(alignment: .leading, spacing: 10){
                    NavigationCustomBar(
                        title: NSLocalizedString("eng.title", comment: ""),
                        isImage: false,
                        navigationSelection: $sourceNavigation
                    ) {
                        HStack{
                            VStack(alignment: .leading, spacing: 20) {
                                Text(NSLocalizedString("eng.subtitle.source", comment: ""))
                                    .multilineTextAlignment(.center)
                                    .font(SubTitleFontStyle().titleFont)
                                    .padding(.leading,20)
                                ListFundCard(
                                    sourceNavigation:$sourceNavigation,
                                    listFunds: funds
                                )
                                 Spacer()
                            }
                            Spacer()
                        }.padding([.horizontal,.vertical],10)
            
                }

            }
            .onAppear {
                loadData()
            }
        }
    }
}


//struct SourceOfFund_Previews: PreviewProvider {
//    static var previews: some View {
//        SourceOfFund()
//    }
//}
