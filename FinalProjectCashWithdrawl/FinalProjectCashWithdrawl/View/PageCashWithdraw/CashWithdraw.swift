//
//  CashWithdraw.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 20/06/22.
//

import SwiftUI

struct CashWithdraw: View {
    @State var phoneNumber: String = ""
    @State var pin: String = ""
    @State var selectedAmount : Int = 0
    @State private var isErrorPhone : Bool = true
    @State private var isErrorPin : Bool = true
    @State private var isErrorAmount : Bool = true
    @State private var showingSheet = false
    @Binding var fund : Fund
    @Binding var sourceNavigation : String?
    @State private var navigationSelection : String? = nil
    @State var isNavigationBarHidden: Bool = false
    @State private var selectedShow = false
    private func renderLink() -> some View{
        Group{
            NavigationLink(destination: TransactionPin(fund: $fund,sourceNavigation: $sourceNavigation), tag: "TransactionPin",selection: $navigationSelection){EmptyView()}
            NavigationLink(destination: HistoryToken(sourceNavigation: $sourceNavigation), tag: "History",selection: $navigationSelection){EmptyView()}
        }
    }
    private func onMovePage(){
        navigationSelection = "TransactionPin"
    }
    private func onMoveHistoryPage(){
        navigationSelection = "History"
    }
    private func onCheck(){
        if phoneNumber ==  "" {
            isErrorPhone = false
        }
        else{
            isErrorPhone = true
            
        }
        
        if pin ==  "" || pin.count < 6{
            isErrorPin = false
        }
        else{
            isErrorPin = true
        }
        
        if selectedAmount ==  0 {
            isErrorAmount = false
        }
        else{
            isErrorAmount = true
        }
        if isErrorPhone || isErrorPin || isErrorAmount {
            if fund.saldo > selectedAmount {
                onMovePage()
            }
            else{
                print("Saldo Tidak Cukup")
                self.selectedShow = true
            
            }
        }
    }
    
    var body: some View {
        renderLink()
        NavigationCustomBar(title: "Cash Withdraw", isImage: true, navigationSelection: $navigationSelection){
            VStack (alignment: .leading,spacing : 10){
                FormWithdraw{
                    VStack(alignment: .leading, spacing: 20){
                        CustomTextField(
                            value: $phoneNumber,
                            isError : isErrorPhone, title: NSLocalizedString("eng.phone.title", comment: ""),
                            placeHolder: NSLocalizedString("eng.phone.placeholder", comment: ""),
                            errorMassage:  NSLocalizedString("eng.phone.error", comment: "")
                        )
                        Button(action: {
                            self.showingSheet.toggle()
                        }, label: {
                            SheetAmount(
                                selectedAmount: $selectedAmount,
                                errorMsg:NSLocalizedString("eng.amount.error", comment: ""),
                                isError: isErrorAmount
                            )
                        }).sheet(isPresented: $showingSheet) {
                            SheetView(selectedAmount: $selectedAmount)
                        }
                        CustomTextField(
                            value: $pin,
                            isError : isErrorPin,
                            title: NSLocalizedString("eng.pin.title", comment: ""),
                            placeHolder: NSLocalizedString("eng.pin.placeholder", comment: ""),
                            errorMassage: NSLocalizedString("eng.pin.error", comment: "")
                        )
                    }.padding(.all,30)
                }
                Spacer()
                ButtonView(
                    buttonStyle: PrimaryButtonStyle(),
                    label: "Continue",action: {
                        onCheck()
                    }).frame(alignment : .bottom)

            }.padding([.all] , 20)
                .alert(isPresented: $selectedShow) {
                    Alert(title: Text("Insufficient Balance"), message: Text("Your account balance is insufficient to continue this transaction"), dismissButton: .default(Text("Got it!")))
                    
                }
                
            
        }
        
    }
}

