//
//  HomePageView.swift
//  WhereWithal
//
//  Created by Indhu on 09/07/24.
//

import SwiftUI
import Charts

struct HomePageView: View {
    let groups = ["Income", "Expenditure", "Savings", "Goals", "Loans"]
    
    let tabSpace = "            "
    
    @State private var showIncomeView = false
    @State private var showExpenseView = false
    @State private var showSavingsView = false
    @State private var showLoansView = false
    @State private var showGoalsView = false
    
    var income = Income().getTotal()
    var expenditure = Expenditure().getTotal()
    var saving = Savings().getTotal()
    var loan = Loans().getTotal()
    
    var body: some View {
            VStack {
                Text(tabSpace)
                Text("Your financial future will be")
                    .font(.title3)
                    .fontWeight(.ultraLight)
                    .foregroundStyle(.black)
                    .fontDesign(.rounded)
                Text("brighter than your past")
                    .font(.title3)
                    .foregroundStyle(.orange)
                    .fontDesign(.rounded)
                Divider()
                Text(tabSpace)
                Button(action: { showIncomeView = true }) {
                    Text(tabSpace + "Income")
                        .fontWeight(.medium)
                        .font(.title2)
                        .colorMultiply(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                NavigationLink("", destination:  Income(), isActive: $showIncomeView)
                Text(tabSpace)
                Button(action: { showExpenseView = true }) {
                    Text(tabSpace + "Expenditure")
                        .fontWeight(.medium)
                        .font(.title2)
                        .colorMultiply(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                NavigationLink("", destination:  Expenditure(), isActive: $showExpenseView)
                Text(tabSpace)
                Button(action: { showSavingsView = true }) {
                    Text(tabSpace + "Savings")
                        .fontWeight(.medium)
                        .font(.title2)
                        .colorMultiply(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                NavigationLink("", destination:  Savings(), isActive: $showSavingsView)
                Text(tabSpace)
                Button(action: { showGoalsView = true }) {
                    Text(tabSpace + "Goals")
                        .fontWeight(.medium)
                        .font(.title2)
                        .colorMultiply(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                NavigationLink("", destination:  Goals(), isActive: $showGoalsView)
                Text(tabSpace)
                Button(action: { showLoansView = true }) {
                    Text(tabSpace + "Loans")
                        .fontWeight(.medium)
                        .font(.title2)
                        .colorMultiply(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                NavigationLink("", destination:  Loans(), isActive: $showLoansView)
                Spacer()
                Spacer()
                Divider()
                Text(tabSpace)
                Text("Interpretation of your finances")
                Text(tabSpace)
                Chart {
                    ForEach(PersonalFinance, id: \.name) { finance in
                        BarMark(
                            x: .value("Type", finance.name),
                            y: .value("Amount", finance.count)
                        )
                        .foregroundStyle(by: .value("Type", finance.name))
                    }
                }
                .frame(height: 100)
                .frame(width: 330)
            }
    }
    
    private var PersonalFinance = [
        (name: "Income", count: 100000),
        (name: "Expenditure", count: 15000),
        (name: "Savings", count: 30000),
        (name: "Goals", count: 200000),
        (name: "Loans", count: 55000)
    ]
    
}

#Preview {
    HomePageView()
}
