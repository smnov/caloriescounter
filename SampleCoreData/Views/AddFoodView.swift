//
//  AddFoodView.swift
//  SampleCoreData
//
//  Created by Александр Семенов on 16.01.2024.
//

import SwiftUI

struct AddFoodView: View {
    
    @Environment (\.managedObjectContext) var managedObjectContext
    @Environment (\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var calories: Double = 0
    
    var body: some View {
        Form {
            Section {
                TextField("Food name", text: $name)
                VStack {
                    Text("Calories:  \(Int(calories))")
                    Slider(value: $calories, in: 0...1000, step: 10)
                }
                .padding()
                HStack {
                    Spacer()
                    Button {
                        DataController().addFood(name: name, calories: calories, context: managedObjectContext)
                        dismiss()
                    } label: {
                        Text("Submit")
                    }
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    AddFoodView()
}
