//
//  Expenditure.swift
//  WhereWithal
//
//  Created by Indhu on 10/07/24.
//

import SwiftUI

struct Exp: Identifiable, Equatable {
    var id: String { category }
    let category: String
    let amount: Int
    
}

struct Expenditure: View {
    @State var exps = [Exp(category: "Sample", amount: 0)]
    @State private var showingPopover = false
    @State private var count = 1
    @State private var category = ""
    @State private var amount = ""
    
    func getTotal() -> Int {
        var amount = 0
        for obj in exps {
            amount = amount + obj.amount
        }
        return amount
    }
    
    var body: some View {
        Spacer()
        Text("Beware of little expenses")
            .font(.title3)
            .fontWeight(.ultraLight)
            .foregroundStyle(.green)
            .fontDesign(.rounded)
        Text("a small leak will sink a great ship.")
            .font(.title3)
            .foregroundStyle(.yellow)
            .fontDesign(.rounded)
        List {
            Grid {
                GridRow {
                    Text("Category")
                    Text("Amount")
                    Text(" ")
                }
                .bold()
                Divider()
                if exps.isEmpty == false {
                    ForEach(exps) {exp in
                        GridRow {
                            Text(exp.category)
                            Text(exp.amount, format: .number)
                            Button(action: {
                                showingPopover = true
                                category = exp.category
                                amount = String(exp.amount)
                            },
                            label: { Text("Edit") })
                        }
                        if exp != exps.last {
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
            Text("Add Expense")
        }).popover(isPresented: $showingPopover) {
            VStack {
                Text("          ")
                Text("Hey, what's your expense ?")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("          ")
                TextField("Spent on ?", text:$category)
                    .font(.caption)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(width: 250)
                    .frame(height: 50)
                    .onSubmit {
                        print(category)
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
                    addExpense(ctgry: category , amnt: amount)
                    showingPopover = false
                    category = ""
                    amount = ""
                },
                label: {
                    Text("\n")
                    Text("Done")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
                Button(action: {
                    deleteExpenditure(ctgy: category)
                    showingPopover = false
                    category = ""
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
    
    func addExpense(ctgry: String, amnt: String) {
        if (ctgry != "") && (amnt != "") {
            exps.append(Exp(category: ctgry, amount: (amnt as NSString).integerValue))
            count += 1
        }
    }
    
    func deleteExpenditure(ctgy: String) {
        var n = 0
        for elem in exps {
            if elem.category ==  ctgy {
                exps.remove(at: n)
            }
            n = n + 1
        }
    }
}

#Preview {
    Expenditure()
}
