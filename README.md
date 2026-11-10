# Community Learning Center Management System


**Mobile Development – Midterm Laboratory Examination**  
**Dart Programming Fundamentals and Object-Oriented Programming**


---


## 1. Project Information


| Field | Details |
|---|---|
| Project Title | Community Learning Center Management System |
| Programming Language | Dart |
| Application Type | Console-Based Application |
| Subject | Mobile Development |
| Student Name | Rehan T. Alamada|
| Section | BSIT3.8 |
| Examination Coverage | Weeks 7–10 (CO3) |


## 2. Project Description


The Community Learning Center Management System is a console-based application developed using Dart. It is designed to organize and manage learning resources and participant records within a community learning center.


The application allows users to add learning resources, register participants, process borrowing and returning transactions, and display organized records through a menu-driven interface.


It demonstrates fundamental Dart programming concepts and Object-Oriented Programming (OOP) principles, including classes, objects, constructors, encapsulation, inheritance, polymorphism, abstraction, and mixins.


## 3. Application Features


The system provides the following functionalities:


- **Learning Resource Management** – Add and manage learning resources, including their identification and availability status.
- **Participant Registration** – Register participants and maintain their personal records.
- **Resource Borrowing** – Process borrowing transactions while checking resource availability.
- **Resource Returning** – Update the availability status of returned resources.
- **Learning Resource Records** – Display registered learning resources and their current status.
- **Participant Records** – View registered participants and their information.
- **Transaction History** – Display recorded borrowing and returning activities.
- **Input Validation** – Handle invalid menu selections and inappropriate or missing inputs.


## 4. Technical Implementation


The application uses the following Dart programming concepts:


### A. Dart Programming Fundamentals


- Variables and data types such as `String`, `int`, `double`, and `bool`.
- Console input and output.
- Arithmetic, comparison, and logical operators.
- Conditional statements using `if-else` and `switch`.
- Loops for menu navigation and displaying records.
- User-defined functions for organizing application operations.
- Input validation and error handling.


### B. Object-Oriented Programming


- **Classes and Objects** – Represent learning resources, participants, and the management system.
- **Constructors** – Initialize objects with their required information.
- **Methods** – Define operations and behaviors for each class.
- **Encapsulation** – Protect class fields using private variables and controlled access through getters and setters.
- **Lists and Maps** – Store and organize resource, participant, and transaction records.


### C. Advanced Object-Oriented Programming


- **Abstraction** – Use an abstract parent class to define common properties and behaviors.
- **Inheritance** – Create specialized classes that inherit from a shared parent class.
- **Polymorphism** – Allow different subclasses to implement and use a shared method in their own way.
- **Method Overriding** – Provide specific implementations of inherited methods.
- **Mixins** – Reuse common behaviors across classes without requiring additional inheritance.


## 5. Application Structure


The project is organized into the following main components:


| Component | Responsibility |
|---|---|
| `CenterRecord` | Abstract parent class for center records |
| `LearningResource` | Manages learning resource information |
| `Participant` | Manages participant information |
| `TimestampMixin` | Provides reusable timestamp functionality |
| `Borrowable` | Provides borrowing and returning behavior |
| `LearningCenter` | Manages resources, participants, and transactions |
| `main()` | Controls the application menu and execution flow |


## 6. Sample Test Scenarios


The application must be tested using different input scenarios to verify its functionality and error handling.


| Test Case | Test Description | Expected Result |
|---|---|---|
| TC01 | Add a new learning resource using valid information. | The resource is successfully registered. |
| TC02 | Register a participant using valid information. | The participant is successfully registered. |
| TC03 | Borrow an available learning resource. | The borrowing transaction is processed and the resource becomes unavailable. |
| TC04 | Attempt to borrow an unavailable resource. | The system displays an appropriate error message. |
| TC05 | Return a previously borrowed resource. | The return transaction is processed and the resource becomes available. |
| TC06 | Enter an invalid menu selection. | The system displays an error message and continues running. |


*Note: Actual test results should be recorded after executing the completed application.*


## 7. Requirements


To run the application, the following are required:


- Dart SDK or an online Dart development environment.
- A code editor such as Visual Studio Code, or DartPad.
- A terminal or console that supports standard input and output.


## 8. Installation and Execution


### Using a Local Dart Environment


1. Install the Dart SDK from the official Dart website.
2. Clone or download this repository.
3. Open the project folder in your preferred code editor.
4. Locate the `main.dart` file.
5. Open a terminal in the project directory.
6. Execute the following command:


```bash
dart run main.dart
```


### Using DartPad


1. Visit [GDB](https://onlinegdb.com).
2. Select the Dart console environment.
3. Open or paste the contents of `main.dart`.
4. Run the application.


*Note: Verify that the selected environment supports console input through `stdin` before using the application.*


## 9. Project File Structure


```text
CommunityLearningCenter/
│
├── main.dart
└── README.md
```
