//
//  UserData.swift
//  werrew
//
//  Created by 于忠涛 on 2024/6/24.
//

import Foundation
import UserNotifications
var encoder = JSONEncoder()
var decoder = JSONDecoder()


let NotificationContent = UNMutableNotificationContent()


class ToDo: ObservableObject {
    @Published var ToDoList: [SingleToDo]
    var count = 0
    
    init() {
        self.ToDoList = []
    }
    init(data: [SingleToDo]) {
        self.ToDoList = []
        for item in data {
            self.ToDoList.append(
                SingleToDo(title: item.title,duedate: item.duedate, isChecked: item.isChecked, id: self.count, isFavorite: item.isFavorite)
            )
            self.count += 1
        }
    }
    
    func check(id: Int) {
        self.ToDoList[id].isChecked.toggle()
        self.dataStore()
    }
    
    func add(data: SingleToDo) {
        self.ToDoList.append(
            SingleToDo(title: data.title, duedate: data.duedate, id: self.count, isFavorite: data.isFavorite)
        )
        self.count += 1
        self.sort()
        self.dataStore()
        
        self.sendNotification(id: self.ToDoList.count - 1)
    }
    
    func sendNotification(id: Int) {
        NotificationContent.title = self.ToDoList[id].title
        NotificationContent.sound = UNNotificationSound.default
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: self.ToDoList[id].duedate.timeIntervalSinceNow, repeats: false)
        // 多少秒触发 时间间隔触发 地区的触发
        
        // 区分每一个通知
        let request = UNNotificationRequest(identifier: self.ToDoList[id].title + self.ToDoList[id].duedate.description,
                                            content: NotificationContent, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
        
    }
    
    func edit(id: Int, data: SingleToDo) {
        self.withdrawNotification(id: id)
        self.ToDoList[id].title = data.title
        self.ToDoList[id].duedate = data.duedate
        self.ToDoList[id].isChecked = false
        self.sort()
        self.dataStore()
        self.ToDoList[id].isFavorite = data.isFavorite
        
        // 需要把修改之前的通知去掉呗
        self.sendNotification(id: id)
    }
    
    func withdrawNotification(id: Int) {
        // 这个方法只能够撤回已经发送，在通知中心之中的通知 没有办法撤回还没有发送的通知
        UNUserNotificationCenter.current().removeDeliveredNotifications(withIdentifiers: [self.ToDoList[id].title + self.ToDoList[id].duedate.description])
        //
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [self.ToDoList[id].title + self.ToDoList[id].duedate.description])
    }
    
    func sort() {
        self.ToDoList.sort(by: { (data1, data2) in
            return data1.duedate.timeIntervalSince1970 <  data2.duedate.timeIntervalSince1970
        })
        
        // 调整一些id
        for i in 0..<self.ToDoList.count {
            self.ToDoList[i].id = i
        }
    }
    
    func delete(id: Int) {
        self.withdrawNotification(id: id)
        self.ToDoList[id].deleted = true
        self.sort()
        self.dataStore()
    }
    
    func dataStore() {
        // try! 可能会抛出错误，我们加一个！证明实际上是不会的
        let dataStored = try! encoder.encode(self.ToDoList)
        UserDefaults.standard.set(dataStored, forKey: "ToDoList")
    }
}


struct SingleToDo: Identifiable, Codable {
    var title: String = ""
    var duedate: Date = Date()
    var isChecked: Bool = false
    var id : Int = 0
    var deleted: Bool = false
    
    var isFavorite: Bool = false
}






















