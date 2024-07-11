//
//  Savings.swift
//  WhereWithal
//
//  Created by Indhu on 10/07/24.
//

import SwiftUI

struct Save: Identifiable, Equatable {
    var id: String { account }
    let account: String
    let amount: Int
}

struct Savings: View {
    
    @State var savings = [Save(account: "Sample", amount: 0)]
    @State private var showingPopover = false
    @State private var count = 1
    @State private var account = ""
    @State private var amount = ""
    
    func getTotal() -> Int {
        var amount = 0
        for obj in savings {
            amount = amount + obj.amount
        }
        return amount
    }
    
    var body: some View {
        Spacer()
        Text("The art is not making money")
            .font(.title3)
            .fontWeight(.ultraLight)
            .foregroundStyle(.red)
            .fontDesign(.rounded)
        Text("but keeping it")
            .font(.title3)
            .foregroundStyle(.blue)
            .fontDesign(.rounded)
        List {
            Grid {
                GridRow {
                    Text("Account")
                    Text("Amount")
                    Text(" ")
                }
                .bold()
                Divider()
                if savings.isEmpty == false {
                    ForEach(savings) { sv in
                        GridRow {
                            Text(sv.account)
                            Text(sv.amount, format: .number)
                            Button(action: {
                                showingPopover = true
                                account = sv.account
                                amount = String(sv.amount)
                            },
                            label: { Text("Edit") })
                        }
                        if sv != savings.last {
                            Divider()
                        }
                    }
                }
                Divider()
                Divider()
                GridRow {
                    Text("Total")
                    Text(getTotal(), format: .number)
                }.bold()
            }
        }
        Button(action: {
            showingPopover = true
        },
        label: {
            Text("\n")
            Text("Add Savings")
        }).popover(isPresented: $showingPopover) {
            VStack {
                Text("          ")
                Text("What's up with your savings ?")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("          ")
                TextField("Where did you save ?", text:$account)
                    .font(.caption)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(width: 250)
                    .frame(height: 50)
                    .onSubmit {
                        print(account)
                    }
                TextField("How much ?", text:$amount)
                    .font(.caption)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(width: 250)
                    .frame(height: 50)
                    .onSubmit {
                        print(amount)
                    }
                Text("          ")
                Button(action: {
                    addSaving(acnt: account , amnt: amount)
                    showingPopover = false
                    account = ""
                    amount = ""
                },
                label: {
                    Text("\n")
                    Text("Done")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
                Button(action: {
                    deleteSaving(acnt: account)
                    showingPopover = false
                    account = ""
                    amount = ""
                },
                label: {
                    Text("\n")
                    Text("                                          Delete")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .underline()
                })
            }
            .background(Color.yellow)
            .frame(height: 300)
            .cornerRadius(20)
        }
        
    }
    
    func addSaving(acnt: String, amnt: String) {
        if (acnt != "") && (amnt != "") {
            savings.append(Save(account: acnt, amount: (amnt as NSString).integerValue))
            count += 1
        }
    }
    
    func deleteSaving(acnt: String) {
        var n = 0
        for elem in savings {
            if elem.account ==  acnt {
                savings.remove(at: n)
            }
            n = n + 1
        }
    }
}

#Preview {
    Savings()
}
