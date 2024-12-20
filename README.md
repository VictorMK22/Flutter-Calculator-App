Calculator App
This project is a Calculator App built using Flutter. It allows users to perform basic arithmetic operations with an intuitive interface.

Features
Addition: Adds two numbers.

Subtraction: Subtracts one number from another.

Multiplication: Multiplies two numbers.

Division: Divides one number by another (with error handling for division by zero).

Clear: Resets the input fields and the result.

Learning Objectives
This activity helps in understanding:

How to create a StatefulWidget for managing user input and calculations.

Handling user input using TextField widgets.

Displaying results dynamically using the setState() method.

Building a user-friendly interface with widgets like:

Scaffold

AppBar

Column

Row

TextField

ElevatedButton

Basic error handling in Flutter (e.g., division by zero).

Code Structure
main() Function
The entry point of the application:

void main() {
  runApp(
    const MaterialApp(
      home: CalculatorApp(),
    ),
  );
}
MaterialApp: Provides the app with Material Design visuals.

CalculatorApp: The main StatefulWidget that houses the calculator logic.

CalculatorApp Class
This is the main widget of the app:

State Management:

Uses variables to track the two input numbers and the result.

setState() updates the UI dynamically when calculations are performed.

Methods:

add(): Adds the two input numbers.

subtract(): Subtracts the second number from the first.

multiply(): Multiplies the two input numbers.

divide(): Divides the first number by the second, with error handling for division by zero.

clear(): Resets all inputs and the result.

UI Design
AppBar: Displays the app title.

Body:

Two input fields for entering numbers.

Buttons for each arithmetic operation and clearing the inputs.

Displays the calculation result dynamically.

Example UI Layout
+-------------------------------------+
|             Calculator App          |
+-------------------------------------+
|   Enter first number: [     ]       |
|   Enter second number: [     ]      |
|                                     |
|   [ Add ] [ Subtract ]              |
|   [ Multiply ] [ Divide ]           |
|   [ Clear ]                         |
|                                     |
|   Result: 0                         |
+-------------------------------------+
How to Run
Clone the repository or copy the code to your local machine.

Open the project in your Flutter-supported IDE (e.g., Android Studio, VS Code).

Ensure Flutter SDK is installed and configured.

Run the app using:
