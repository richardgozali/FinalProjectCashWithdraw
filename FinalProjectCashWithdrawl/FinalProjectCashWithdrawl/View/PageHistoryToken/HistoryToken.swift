//
//  History.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 23/06/22.
//

import SwiftUI

struct HistoryToken: View {
    @State private var articels = [Articel]()
    @Binding var sourceNavigation : String?
    @State var selectedHistoryToken : History = History()
    @State private var navigationSelection : String? = nil
    @State var historytokens = [History]()
    
    private func renderLink() -> some View{
    
        NavigationLink(
            destination: DetailHistoryToken(selectedHistoryToken: $selectedHistoryToken),
            tag: "DetailHistory",
            selection: $navigationSelection
        ){EmptyView()}
        
    }
    
    private func loadData(){
        
        guard let data = JsonReader.loadDataFrom(filename: "History") else{
            return
        }
        do{
            self.historytokens = try JSONDecoder().decode([History].self, from: data)
            
            print(historytokens[0])
        }catch{
            print(error)
            return
        }
        
    }
    private func onMovePageDetailHistory(selectedHistoryToken : History) {
        navigationSelection = "DetailHistory"
        self.selectedHistoryToken = selectedHistoryToken
        print(self.selectedHistoryToken)
    }
    var body: some View {
        NavigationCustomBar(
            title: "Token History",
            isImage: false ,
            navigationSelection: $sourceNavigation
        ){
            VStack{
                renderLink()
                Spacer().frame(height:20)
                ScrollView(.vertical){
                    ForEach($historytokens, id: \.self){ history in
                        CardHistoryToken(selectedHistory: history).onTapGesture {
                            onMovePageDetailHistory(selectedHistoryToken: history.wrappedValue)
                        }
                    }
                }
                Spacer()
            }
        }
        .onAppear(){
            loadData()
        }
    }
}

//struct History_Previews: PreviewProvider {
//    static var previews: some View {
//        HistoryToken()
//    }
//}
