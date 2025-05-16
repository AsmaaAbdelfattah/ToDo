//
//  CoreData.swift
//  TODO
//
//  Created by asma abdelfattah on 16/05/2025.
//

import Foundation
import CoreData
import Foundation
import CoreData

class TaskManager {
    static let shared = TaskManager()

    private let container: NSPersistentContainer
    private(set) var tasks: [TaskEntity] = []

    private init() {
        container = NSPersistentContainer(name: "Task")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("❌ Failed to load Core Data: \(error.localizedDescription)")
            } else {
                print("✅ Core Data loaded")
            }
        }
        fetchTasks()
    }

    // MARK: - Fetch
    func fetchTasks() {
        let request: NSFetchRequest<TaskEntity> = TaskEntity.fetchRequest()
        do {
            tasks = try container.viewContext.fetch(request)
        } catch {
            print("❌ Error fetching tasks: \(error.localizedDescription)")
        }
    }

    // MARK: - Add
    func addTask(title: String) {
        let task = TaskEntity(context: container.viewContext)
        task.id = UUID()
        task.title = title
        task.isDone = false
        saveContext()
    }

    // MARK: - Delete
    func deleteTask(_ task: TaskEntity) {
        container.viewContext.delete(task)
        saveContext()
    }

    // MARK: - Toggle Completion
    func toggleTask(_ task: TaskEntity) {
        task.isDone.toggle()
        saveContext()
    }

    // MARK: - Save
    private func saveContext() {
        do {
            try container.viewContext.save()
            fetchTasks()
        } catch {
            print("❌ Error saving context: \(error.localizedDescription)")
        }
    }
}
