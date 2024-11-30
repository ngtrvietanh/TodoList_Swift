//
//  AddView.swift
//  TodoList
//
//  Created by Việt Anh on 26/11/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModal: ListViewModel
    @State var input: String = ""
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        ScrollView{
            VStack{
                TextField("Say something here...", text: $input)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background (Color(UIColor.white))
                    .cornerRadius(10)
                Button(action: saveButtonPressed,
                    label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background (Color.accentColor)
                        .cornerRadius (10)
                })
            }.padding(14)
        }
        .navigationTitle("Add an Item ✒️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate(){
            listViewModal.addItem(title: input)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if input.count < 3 {
            alertTitle = "😭😭😭"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
}
