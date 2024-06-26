//
//  EditingPage.swift
//  werrew
//
//  Created by 于忠涛 on 2024/6/25.
//

import SwiftUI

struct EditingPage: View {
    @Environment(\.presentationMode) var presentation
    @EnvironmentObject var UserData: ToDo
    @State var title: String = ""
    @State var duedate: Date = Date()
    @State var isFavorite = false
    // 空的话就是添加模式，有值的话就是编辑模式呗
    @State var id: Int? = nil
    var body: some View {
        NavigationView {
            Form {
                Section() {
                    TextField("事项内容", text: self.$title)
                    
                    DatePicker(selection: self.$duedate, label: {
                        Text("截止时间")
                    })
                }
                
                Section {
                    Toggle(isOn: self.$isFavorite) {
                        Text("收藏")
                    }
                }
                
                Section() {
                    Button(action: {
                        self.presentation.wrappedValue.dismiss()
                    }) {
                        Text("取消")
                    }
                    
                    Button(action: {
                        withAnimation(.spring()) {
                            if self.id == nil {
                                self.UserData.add(data: SingleToDo(title:self.title, duedate: self.duedate, isFavorite: false))
                            } else {
                                self.UserData.edit(id: self.id!, data: SingleToDo(title:self.title, duedate: self.duedate, isFavorite: self.isFavorite))
                            }
                            self.presentation.wrappedValue.dismiss()
                        }
                        
                    }) {
                        Text("确认")
                    }
                    
                }
                
            }
            .navigationBarTitle("添加")
        }
    }
}

#Preview {
    EditingPage()
}
