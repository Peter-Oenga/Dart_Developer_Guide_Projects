# Dart Console-Based To-Do App

This console-based To-Do List app in Dart is designed for intermediate developers looking to build a structured project that covers core Dart concepts like classes, functions, libraries, and file organization. This app allows users to create, view, mark, and delete tasks through a simple command-line interface.

## Features

- **Add Tasks**: Create new to-do items.
- **View Tasks**: Display all tasks, with completion status.
- **Mark Tasks**: Toggle tasks between completed and incomplete.
- **Delete Tasks**: Remove tasks from the list.

## Project Structure

The app is organized into multiple folders to separate the main logic, model, services, and utility functions. Below is an overview of the folder structure:

```plaintext
todo_app/
├── lib/
│   ├── main.dart              # Main entry point
│   ├── models/
│   │   └── task.dart          # Task model
│   ├── services/
│   │   └── task_service.dart  # Core app logic (task management)
│   └── utils/
│       └── input_util.dart    # User input and validation utilities
└── pubspec.yaml               # Dart project configuration
