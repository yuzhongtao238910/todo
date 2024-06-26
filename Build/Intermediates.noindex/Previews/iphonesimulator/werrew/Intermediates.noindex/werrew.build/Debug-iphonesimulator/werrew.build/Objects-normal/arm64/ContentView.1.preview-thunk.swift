@_private(sourceFile: "ContentView.swift") import werrew
import func SwiftUI.__designTimeBoolean
import func SwiftUI.__designTimeInteger
import protocol SwiftUI.PreviewProvider
import func SwiftUI.__designTimeString
import func SwiftUI.__designTimeFloat
import struct SwiftUI.EmptyView
import protocol SwiftUI.View
import SwiftUI

extension SingleCardView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/yuzhongtao/Desktop/werrew/werrew/ContentView.swift", line: 87)
        HStack {
            Rectangle()
                .frame(width: __designTimeInteger("#9104.[3].[3].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: 6))
                .foregroundColor(.red)
            
            Button(action: {
                self.UserData.delete(id: self.index)
            }) {
                Image(systemName: __designTimeString("#9104.[3].[3].property.[0].[0].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "trash"))
                    .imageScale(.large)
                    .padding(.leading)
            }
            
            Button(action: {
                self.showEditingPage = __designTimeBoolean("#9104.[3].[3].property.[0].[0].arg[0].value.[2].arg[0].value.[0].[0]", fallback: true)
            }) {
                Group {
                    VStack(alignment: .leading, spacing: __designTimeInteger("#9104.[3].[3].property.[0].[0].arg[0].value.[2].arg[1].value.[0].arg[0].value.[0].arg[1].value", fallback: 10)) {
                        Text(self.UserData.ToDoList[index].title)
                            .font(.headline)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        Text(self.UserData.ToDoList[index].duedate.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    .padding(.leading)
                    
                    Spacer()
                }
            }
            .sheet(isPresented: self.$showEditingPage, content: {
                EditingPage(
                            title: self.UserData.ToDoList[self.index].title,
                            duedate: self.UserData.ToDoList[self.index].duedate,
                            id: self.index
                )
                    .environmentObject(self.UserData)
            })
            
            
            Image(systemName: self.UserData.ToDoList[index].isChecked ? __designTimeString("#9104.[3].[3].property.[0].[0].arg[0].value.[3].arg[0].value.then", fallback: "checkmark.square.fill") : __designTimeString("#9104.[3].[3].property.[0].[0].arg[0].value.[3].arg[0].value.else", fallback: "square"))
                .imageScale(.large)
                .padding(.trailing)
                .onTapGesture {
                    self.UserData.check(id: self.index)
                }
        }
        .frame(height: __designTimeInteger("#9104.[3].[3].property.[0].[0].modifier[0].arg[0].value", fallback: 80))
        .background(Color.white)
        .cornerRadius(__designTimeInteger("#9104.[3].[3].property.[0].[0].modifier[2].arg[0].value", fallback: 10))
        .shadow(radius: /*@START_MENU_TOKEN@*/__designTimeInteger("#9104.[3].[3].property.[0].[0].modifier[3].arg[0].value", fallback: 10)/*@END_MENU_TOKEN@*/, x: __designTimeInteger("#9104.[3].[3].property.[0].[0].modifier[3].arg[1].value", fallback: 10), y: __designTimeInteger("#9104.[3].[3].property.[0].[0].modifier[3].arg[2].value", fallback: 10))
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/yuzhongtao/Desktop/werrew/werrew/ContentView.swift", line: 34)
        ZStack {
            NavigationView {
                ScrollView(.vertical) {
                    VStack {
                        ForEach(self.UserData.ToDoList){ item in
                            if item.deleted {
                                
                            } else {
                                SingleCardView(index: item.id)
                                    .environmentObject(self.UserData)
                                    .padding(.top)
                                    .padding(.horizontal)
                            }
                            
                        }
                    }
                }
                .navigationBarTitle(__designTimeString("#9104.[2].[2].property.[0].[0].arg[0].value.[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: "提醒事项"))
            }
            
            
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Button(action: {
                        self.showEditingPage = __designTimeBoolean("#9104.[2].[2].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[1].arg[0].value.[0].[0]", fallback: true)
                        
                    }) {
                        Image(systemName: __designTimeString("#9104.[2].[2].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0].arg[0].value", fallback: "plus.circle.fill"))
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: __designTimeInteger("#9104.[2].[2].property.[0].[0].arg[0].value.[1].arg[0].value.[1].arg[0].value.[1].arg[1].value.[0].modifier[2].arg[0].value", fallback: 80))
                            .foregroundColor(.blue)
                            .padding(.trailing)
                    }
                    .sheet(isPresented: self.$showEditingPage) {
                        EditingPage()
                            .environmentObject(self.UserData)
                    }
                    
                }
            }
        }
    
#sourceLocation()
    }
}

@_dynamicReplacement(for: initUserData()) private func __preview__initUserData() -> [SingleToDo] {
#sourceLocation(file: "/Users/yuzhongtao/Desktop/werrew/werrew/ContentView.swift", line: 11)
    var output: [SingleToDo] = []
    if let dataStored = UserDefaults.standard.object(forKey: "ToDoList") as? Data {
        let data = try! decoder.decode([SingleToDo].self, from: dataStored)
        for item in data {
            if !item.deleted {
                output.append(item)
            }
        }
    }
    return output

#sourceLocation()
}

import struct werrew.ContentView
import struct werrew.SingleCardView
#Preview {
    ContentView()
}



