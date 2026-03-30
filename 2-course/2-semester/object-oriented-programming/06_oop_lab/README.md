# OOP Lab 6: JavaFX Fundamentals

## Project Overview
This laboratory project demonstrates the fundamentals of GUI programming using JavaFX. It contains three distinct applications wrapped in a Main Menu launcher.

The project is designed to be **simple and self-contained**. It avoids polluting your global system environment with heavy build tools like Maven or Gradle. Instead, it uses a lightweight `Taskfile.yml` to orchestrate everything.

---

## 🛠 Project Structure & The `lib/` Folder

Since standard Java (like Java 26) does not come with JavaFX built-in, this project automatically downloads a lightweight **JavaFX SDK** into the local `lib/` folder. 
- **Why?** This guarantees the project works completely in isolation without requiring you to manually install JavaFX globally on your OS.
- **How?** The `Taskfile.yml` handles downloading, extracting, and linking this library during compilation and execution. If you delete the `lib/` folder, the Taskfile will simply redownload it the next time you compile.

### How to Run

You can run the project using the following `task` commands from this directory:

- `task run` - Compiles the project (if needed) and opens the **Main Menu** to launch all tasks.
- `task task1` - Runs Task 1 (Miles/Km Converter) directly.
- `task task2` - Runs Task 2 (Stopwatch) directly.
- `task task3` - Runs Task 3 (Calculator) directly.
- `task clean` - Deletes the compiled `.class` files.
- `task distclean` - Deletes everything, including the downloaded `lib/` folder.

---

## 🧠 JavaFX Core Concepts: How It All Works

If you are ever asked how JavaFX works, remember the **"Theater Metaphor"**. Every JavaFX application is built using the following hierarchy:

### 1. Application (`javafx.application.Application`)
Every JavaFX program must extend this class and override the `start(Stage stage)` method. This is the entry point of your GUI application, entirely replacing `public static void main` for the UI setup.

### 2. Stage (The Window)
Think of the `Stage` as the physical window frame of your application (the part that contains the minimize, maximize, and close buttons provided by your operating system). The `start()` method is handed the "primary stage" automatically by JavaFX.

### 3. Scene (The Content Canvas)
The `Scene` is what is happening *inside* the window. A Stage can only display one Scene at a time. You attach a `Scene` to a `Stage` using `stage.setScene(scene)`. Just like in a real theater, you can transition the app by swapping to a new Scene.

### 4. The Scene Graph (Nodes)
The inside of a Scene is structured as a hierarchical tree called the **Scene Graph**. Everything you see on the screen is a `Node`. Nodes are split into two categories:

- **Root Nodes (Layouts/Panes):** Invisible containers that dictate how UI elements are arranged. 
  - `VBox`: Arranges elements vertically (top to bottom stacked).
  - `HBox`: Arranges elements horizontally (side by side stacked).
  - `GridPane`: Arranges elements in a 2D grid of rows and columns.
- **Leaf Nodes (Controls):** The actual visible and interactive widgets.
  - `Button`, `Label`, `TextField`, etc.

---

## 📦 Project Classes Breakdown: How They Work

Here is the precise list of the 4 Java classes we created to make this lab function, and an explanation of the underlying logic for each:

### 1. `MainMenu.java` (The Launcher)
- **Role:** This is the primary entry point of the entire application. It is the only class that strictly `extends Application` and has the `public static void main` method to formally launch JavaFX.
- **How it works:** 
  - It creates a vertical layout (`VBox`) containing a title and 3 distinct `Button`s.
  - Each button uses a **Lambda expression event handler** (`button.setOnAction(...)`).
  - When you click "Task 1", the handler instantiates a new copy of `ConverterApp` and triggers its `start(new Stage())` method. This allows the sub-tasks to run inside their own, completely new floating window while the Main Menu stays open beneath them.

### 2. `ConverterApp.java` (Task 1: Miles/Km)
- **Role:** A bidirectional mathematical text converter.
- **How it works (UI):** It builds a very simple `GridPane` layout with a 2x2 structure (2 rows, 2 columns) containing two `Label`s and two text input boxes (`TextField`).
- **How it works (Logic):** 
  - It listens specifically for the "Enter key press" event on both fields.
  - If you type inside the **Miles** field and hit enter, the listener fetches the `String`, parses it mathematically into a `double`, multiplies it by the constant `1.60934`, formats it to 4 decimal places, and visibly sets that text into the **Kilometers** field.
  - It wraps this parsing in a `try...catch (NumberFormatException)` block so if the user types letters instead of numbers, it catches the crash and prints "Invalid input" on the screen.

### 3. `StopwatchApp.java` (Task 2: Timer)
- **Role:** A running digital count-up stopwatch.
- **How it works (UI):** It uses a `VBox` to stack the giant time `Label` ("00:00:00") above an `HBox` containing the Start and Clear `Button`s side by side.
- **How it works (Logic):** 
  - Instead of using complicated multithreading (which is dangerous in UI frameworks), it uses JavaFX's built-in `Timeline` animation system.
  - A `Timeline` is initialized with a `KeyFrame` mapped to `Duration.seconds(1)`. This means "Trigger this block of code exactly every 1 second continuously."
  - When triggered, it adds `+1` to the integer counter `elapsedSeconds` and updates the giant Label format (e.g., calculates Hours, Minutes, and Seconds via basic math and modulo division).
  - The "Start/Pause" button simply calls `timeline.play()` or `timeline.pause()` and dynamically flips its own physical text between "Start", "Pause", and "Resume".

### 4. `CalculatorApp.java` (Task 3: Calculator)
- **Role:** A fully functional digital calculator with visual styling resembling the iOS default layout.
- **How it works (UI):** It maps a `GridPane` matrix containing exactly 5 rows and 4 columns, filling it entirely with large square `Button`s holding symbols (digits 0-9, and operators +,-, *, /, %, etc.).
- **How it works (Logic & State):** 
  - It maintains a "calculating memory state" using class variables: `currentInput` (the digits currently showing on the screen phase), `storedValue` (the last committed mathematical number), and `pendingOperator` (the active math operation, like `/` or `+`, waiting to execute).
  - All 19 active buttons route through one giant event switch method called `handleButtonPress(String label)`. 
  - If a user presses a **Digit**, it tacks that digit onto the end of the `String` being read. If an **Operator** is pressed, it commits the `currentInput` to `storedValue` and waits for the next number. When `=` is pressed, it pulls the `storedValue`, the `currentInput`, and the `pendingOperator`, evaluates the math, and renders the result back to the `Label` display panel.
