//
//  Income.swift
//  WhereWithal
//
//  Created by Indhu on 09/07/24.
//

import SwiftUI


struct Stat: Identifiable, Equatable {
    var id: String { source }
    let source: String
    let amount: Int
}

struct Income: View {
    @State var stats = [Stat(source: "Sample", amount: 0)]
    @State private var showingPopover = false
    @State private var selection: String?
    @State private var count = 1
    @State private var source = ""
    @State private var amount = ""
    
    func getTotal() -> Int {
        var amount = 0
        for obj in stats {
            amount = amount + obj.amount
        }
        return amount
    }
    
    var body: some View {
        Spacer()
        Text("Your income can grow only")
            .font(.title3)
            .fontWeight(.ultraLight)
            .foregroundStyle(.blue)
            .fontDesign(.rounded)
        Text("to the extent you do")
            .font(.title3)
            .foregroundStyle(.green)
            .fontDesign(.rounded)
        
         List {
                Grid {
                    GridRow {
                        Text("Source")
                        Text("Amount")
                        Text(" ")
                    }
                    .bold()
                    
                    Divider()
                    
                    if stats.isEmpty ==  false {
                        
                        ForEach(stats) { stat in
                            GridRow {
                                Text(stat.source)
                                Text(stat.amount, format: .number)
                                Button(action: { 
                                    showingPopover = true
                                    source = stat.source
                                    amount = String(stat.amount)
                                },
                                label: { Text("Edit") })
                                
                            }
                            if stat != stats.last {
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
                Text("Hey, what did you earn ?")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("          ")
                TextField("Income source ?", text:$source)
                    .font(.caption)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(width: 250)
                    .frame(height: 50)
                    .onSubmit {
                        print(source)
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
                    addIncome(srce: source , amnt: amount)
                    showingPopover = false
                    source = ""
                    amount = ""
                },
                label: {
                    Text("\n")
                    Text("Done")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
                Button(action: {
                    deleteIncome(srce: source)
                    showingPopover = false
                    source = ""
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
    
    func addIncome(srce: String, amnt: String) {
        if (srce != "") && (amnt != "") {
            stats.append(Stat(source: srce, amount: (amnt as NSString).integerValue))
            count += 1
        }
    }
    
    func deleteIncome(srce: String) {
        var n = 0
        for elem in stats {
            if elem.source ==  srce {
                stats.remove(at: n)
            }
            n = n + 1
        }
    }
}


#Preview {
    Income()
}
