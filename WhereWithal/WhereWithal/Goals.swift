//
//  Goals.swift
//  WhereWithal
//
//  Created by Indhu on 10/07/24.
//

import SwiftUI

struct Goal: Identifiable, Equatable {
    var id: String { what }
    let what: String
    let amount: Int
    let days: Int
}

struct Goals: View {
    @State var goals = [Goal(what: "Sample", amount: 0, days: 0)]
    @State private var showingPopover = false
    @State private var count = 1
    @State private var what = ""
    @State private var amount = ""
    @State private var days = ""
    
    var body: some View {
        Spacer()
        Text("Set goals much higher ")
            .font(.title3)
            .fontWeight(.ultraLight)
            .foregroundStyle(.purple)
            .fontDesign(.rounded)
        Text("and crush them")
            .font(.title3)
            .foregroundStyle(.black)
            .fontDesign(.rounded)
        List {
            Grid {
                GridRow {
                    Text("Goal")
                    Text("Amount")
                    Text("Days left")
                    Text(" ")
                }
                .bold()
                Divider()
                if goals.isEmpty == false {
                    ForEach(goals) { goal in
                        GridRow {
                            Text(goal.what)
                            Text(goal.amount, format: .number)
                            Text(goal.days, format: .number)
                            Button(action: {
                                showingPopover = true
                                what = goal.what
                                amount = String(goal.amount)
                                days = String(goal.days)
                            },
                            label: { Text("Edit") })
                        }
                        if goal != goals.last {
                            Divider()
                        }
                    }
                }
            }
        }
        
        Button(action: {
            showingPopover = true
        },
        label: {
            Text("\n")
            Text("Add Goals")
        }).popover(isPresented: $showingPopover) {
            VStack {
                Text("          ")
                Text("Super! you are having goals.")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("          ")
                TextField("What is the goal ?", text:$what)
                    .font(.caption)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(width: 250)
                    .frame(height: 50)
                    .onSubmit {
                        print(what)
                    }
                TextField("How much money needed ?", text:$amount)
                    .font(.caption)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(width: 250)
                    .frame(height: 50)
                    .onSubmit {
                        print(amount)
                    }
                TextField("In how many days ?", text:$days)
                    .font(.caption)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                    .frame(width: 250)
                    .frame(height: 50)
                    .onSubmit {
                        print(days)
                    }
                Text("          ")
                Button(action: {
                    addGoal(wht: what, amnt: amount, dys: days)
                    showingPopover = false
                    what = ""
                    days = ""
                    amount = ""
                },
                label: {
                    Text("\n")
                    Text("Done")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
                Button(action: {
                    deleteGoal(wt: what)
                    showingPopover = false
                    what = ""
                    amount = ""
                    days = ""
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
            .frame(height: 400)
            .cornerRadius(20)
        }
        
    }
    
    func addGoal(wht: String, amnt: String, dys: String) {
        if (what != "") && (amnt != "")  && (dys != "") {
            goals.append(Goal(what: wht,
                              amount: (amnt as NSString).integerValue,
                              days: (dys as NSString).integerValue))
            count += 1
        }
    }
    
    func deleteGoal(wt: String) {
        var n = 0
        for elem in goals {
            if elem.what ==  wt {
                print(wt)
                print(n)
                goals.remove(at: n)
            }
            n = n + 1
        }
    }
    
}

#Preview {
    Goals()
}
