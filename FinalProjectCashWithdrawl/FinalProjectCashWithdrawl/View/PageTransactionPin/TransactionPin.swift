//
//  TransactionPin.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 23/06/22.
//

import SwiftUI

struct TransactionPin: View {
    @State var isPin : String = ""
    @State var disableTextField : Bool  = false
    @State var isFocused = true
    @Binding var fund : Fund
    @Binding var sourceNavigation : String?
    @State private var navigationSelection : String? = nil
    
    let textBoxWidth = UIScreen.main.bounds.width / 8
    let textBoxHeight = UIScreen.main.bounds.width / 8
    let spaceBetweenBoxes: CGFloat = 10
    let paddingOfBox: CGFloat = 1
    var textFieldOriginalWidth: CGFloat {
        (textBoxWidth*6)+(spaceBetweenBoxes*3)+((paddingOfBox*2)*3)
    }
    enum FocusField: Hashable {
        case field
    }
    
    @FocusState private var focusedField: FocusField?
    
    private func getDataPin(Index: Int) -> String{
        if(isPin.count > Index){
            if isPin.count > Index {
                return "*"
            }
            return ""
        }
        return ""
    }
    func limitText(_ upper: Int = 6) {
        if isPin.count > upper {
            isPin = String(isPin.prefix(upper))
        }
        print(isPin)
    }
    
    var body: some View {
        NavigationCustomBar(title: "Transaction Pin",isImage: false,navigationSelection: $navigationSelection) {
            HStack(spacing: 20){
                VStack(alignment: .center, spacing: 20){
                    
                    VStack{
                        Text("Insert the 6-digit Transaction PIN").font(SubTitleFontStyle().titleFont).foregroundColor(Color.gray)
                    }.padding(.top,20)
                    Image(systemName: "lock.fill").foregroundColor(Color.black)
                    
                    ZStack{
                        
                        HStack (spacing: 10){
                            
                            pinText(text: getDataPin(Index: 0))
                            pinText(text: getDataPin(Index: 1))
                            pinText(text: getDataPin(Index: 2))
                            pinText(text: getDataPin(Index: 3))
                            pinText(text: getDataPin(Index: 4))
                            pinText(text: getDataPin(Index: 5))
                            
                        }.padding([.vertical],20)
                        
                        SecureField("", text: $isPin)
                            .disabled(false)
                            .textContentType(.oneTimeCode)
                            .foregroundColor(.clear)
                            .accentColor(.clear)
                            .background(Color.clear)
                            .keyboardType(.numberPad)
                            .onChange(of: isPin, perform: { newValue in
                                if isPin.count>6{
                                    limitText()
                                }
                                print(isPin)
                            })
                        
                    }
                    
                    Spacer()
                    ButtonView(
                        buttonStyle: PrimaryButtonStyle(),
                        label: "Continue",action: {
                            if String(fund.pin) == isPin{
                                print("Password Benar")
                                self.sourceNavigation = nil
                            }
                            else{
                                print("Password Tidak Benar")
    
                            }
                    })
                }
            }.padding(.all,20)
        }
    }
    private func pinText(text: String) -> some View {
        return Text(text)
            .font(TitleFontStyle().titleFont)
            .frame(width: textBoxWidth, height: textBoxHeight,alignment: .center)
            .padding(paddingOfBox)
            .foregroundColor(Color.blue)
            .background(
                Rectangle().fill(Color.white)
                    .foregroundColor(Color.black)
                    .shadow(color: Color.black, radius: 1)
            )
    }
}


