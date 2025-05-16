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


![Simulator Screenshot - iPhone 16 Pro - 2025-05-16 at 21 33 35](https://github.com/user-attachments/assets/df7b2a42-3eab-45b3-8c08-ea697e195a79)
![Simulator Screenshot - iPhone 16 Pro - 2025-05-16 at 21 33 32](https://github.com/user-attachments/assets/130eda88-ee1c-422e-98a5-7e3cd7e689c3)

