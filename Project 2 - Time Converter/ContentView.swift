//
//  ContentView.swift
//  Time Conversion
//
//  Created by Luca M on 12/29/20.
//

import SwiftUI

struct ContentView: View {
    
    var units = ["sec", "min", "hrs", "days"]
    @State private var input = ""
    @State private var unitIn = 0
    @State private var unitOut = 0
    
    var output: Double {
        
        var num = Double(input) ?? 0.0
        
        switch unitIn {
        case unitOut:
            return num
        case 1:
            num *= 60.0
        case 2:
            num *= 3600.0
        case 3:
            num *= 86400.0
        default: break
        }
        
        switch unitOut {
        case 1:
            num /= 60.0
        case 2:
            num /= 3600.0
        case 3:
            num /= 86400.0
        default:
            return num
        }
        
        return num
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Select units to convert from")) {
                    Picker("Units", selection: $unitIn) {
                        ForEach(0..<units.count) {
                            Text("\(units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Select units to convert to")) {
                    Picker("Units", selection: $unitOut) {
                        ForEach(0..<units.count) {
                            Text("\(units[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Input")) {
                    TextField("Enter amount", text: $input)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Result")) {
                    Text("\(String(output) + " " + units[unitOut])")
                }
            }
            .navigationTitle("Time Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
