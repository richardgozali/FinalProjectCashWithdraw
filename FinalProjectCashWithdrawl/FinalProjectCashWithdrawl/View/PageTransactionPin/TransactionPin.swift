//
//  TransactionPin.swift
//  FinalProjectCashWithdrawl
//
//  Created by Richard G on 23/06/22.
//

import SwiftUI
import Alamofire
struct TransactionPin: View {
    @State var isPin: String = ""
    @State var disableTextField: Bool  = false
    @State var isFocused = true
    @State var isLoading = false
    @Binding var fund: Fund
    @Binding var sourceNavigation: String?
    @Binding var listFunds: [Fund]
    @State private var navigationSelection: String?
    @State private var selectedShow: Bool = false
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
    private func getDataPin(index: Int) -> String {
        if isPin.count > index {
            if isPin.count > index {
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
    private func fetchData() {
        print("data")
        let request = AF.request(baseUrl + "Account")
        request.responseDecodable(of: [Fund].self) { (data) in
            listFunds =  data.value ?? []
            isLoading = false
            self.sourceNavigation = nil
        }
    }
    private func pinText(text: String) -> some View {
        return Text(text)
            .font(TitleFontStyle().titleFont)
            .frame(width: textBoxWidth, height: textBoxHeight, alignment: .center)
            .padding(paddingOfBox)
            .foregroundColor(Color.blue)
            .background(
                Rectangle().fill(Color.white)
                    .foregroundColor(Color.black)
                    .shadow(color: Color.black, radius: 1)
            )
    }

    var body: some View {
        ZStack {
            ProgressView("loading")
                .foregroundColor(Color.blue)
            .modifier(HiddenViewModifier(!isLoading))
            NavigationCustomBar(title: "Transaction Pin", isImage: false, navigationSelection: $navigationSelection) {
                HStack(spacing: 20) {
                    VStack(alignment: .center, spacing: 20) {
                        HStack {
                            VStack {
                                ZStack {
                                    ErrorMessage(
                                        selectedShow: $selectedShow,
                                        title: R.string.localizable.engErrorMessage()
                                    )
                                    VStack {
                                        Text(
                                            "Insert the 6-digit Transaction PIN")
                                        .font(SubTitleFontStyle().titleFont).foregroundColor(Color.gray)
                                    }.modifier(HiddenViewModifier(selectedShow))
                                }
                            }
                        }.frame(height: 40)
                        Image(systemName: "lock.fill").foregroundColor(Color.black)
                        ZStack {
                            HStack(spacing: 10) {
                                pinText(text: getDataPin(index: 0))
                                pinText(text: getDataPin(index: 1))
                                pinText(text: getDataPin(index: 2))
                                pinText(text: getDataPin(index: 3))
                                pinText(text: getDataPin(index: 4))
                                pinText(text: getDataPin(index: 5))
                            }.padding([.vertical], 20)
                            SecureField("", text: $isPin)
                                .disabled(false)
                                .textContentType(.oneTimeCode)
                                .foregroundColor(.clear)
                                .accentColor(.clear)
                                .background(Color.clear)
                                .keyboardType(.numberPad)
                                .onChange(of: isPin, perform: { _ in
                                    if isPin.count>6 {
                                        limitText()
                                    }
                                    print(isPin)
                                })
                        }
                        Spacer()
                        ButtonView(
                            buttonStyle: PrimaryButtonStyle(),
                            label: "Continue", action: {
                                if String(fund.pin) == isPin {
                                    isLoading = true
                                    fetchData()
                                    print("Password Benar")
                                } else {
                                    print("Password Tidak Benar")
                                    withAnimation(Animation.easeIn) {
                                        self.selectedShow = true
                                    }
                                }
                            }).padding(.horizontal, 20)
                    }
                }.modifier(HiddenViewModifier(isLoading))
                .padding(.vertical, 20)
            }
        }
    }
}
