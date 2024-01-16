//
//  EditFoodView.swift
//  SampleCoreData
//
//  Created by Александр Семенов on 16.01.2024.
//

import SwiftUI

struct EditFoodView: View {
    
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment (\.dismiss) var dismiss
    
    var food: FetchedResults<Food>.Element
    
    @State private var name = ""
    @State private var calories: Double = 0
    
    var body: some View {
        Form {
            Section {
                TextField("\(food.name!)", text: $name)
                    .onAppear {
                        name = food.name!
                        calories = food.calories
                    }
                VStack {
                    Text("Calories: \(Int(calories))")
                    Slider(value: $calories, in: 0...1000, step: 10)
                }
                .padding()
                HStack {
                    Spacer()
                    Button {
                        DataController().editFood(food: food, name: name, calories: calories, context: managedObjContext)
                        dismiss()
                    } label: {
                        Text("Submit")
                    }
                }
            }
        }
    }
}
