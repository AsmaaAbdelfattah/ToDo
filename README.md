# ToDo
# Task Manager App

A simple iOS Task Manager app built with **UIKit** and **Storyboards**. The app allows users to:

- Add new tasks using a "+" button.
- View a list of tasks in a **UITableView**.
- Mark tasks as completed using a **UISwitch** toggle.
- Delete tasks with a swipe gesture.
- All data is persisted using **Core Data**.

---

## Features

- 📱 UIKit-based UI with Storyboards
- 📋 Task listing using `UITableView`
- ➕ Add new tasks via an alert with a text field
- ✅ Toggle task completion with `UISwitch`
- 🗑 Swipe to delete tasks
- 💾 Local data persistence with Core Data
- 🔁 CoreDataManager handles add/delete/update/fetch

---

## Architecture

- **UIKit + Storyboards**: Interface is built using Interface Builder.
- **MVC**: Simple Model-View-Controller structure.
- **Core Data**: Used for storing tasks locally.
- **CoreDataManager**: A dedicated class for interacting with Core Data (add, fetch, delete, update).

---

## How it Works

1. Launch the app and see the list of saved tasks.
2. Tap the **"+" button** in the top navigation bar to add a new task.
3. An alert with a text field appears — enter the task title and tap "Save".
4. Each cell shows a task and a toggle switch to mark it as done.
5. Swipe left on a task to delete it.

---

## Screenshots

![WhatsApp Image 2025-05-16 at 21 50 57](https://github.com/user-attachments/assets/cd2c06c7-4348-4106-9c24-17a400e48f41)



