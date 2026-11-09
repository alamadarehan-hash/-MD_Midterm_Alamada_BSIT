# Community Learning Center Management System


## Student Information
Name: Rehan
Section: BSIT3.8
Subject: Mobile Development
Examination: Midterm Laboratory Examination
## Application Description


The Community Learning Center Management System is a Dart console application designed to manage learning resources and participants. It allows users to register learning materials, register participants, process borrowing and returning transactions, and view organized records.


## Implemented Features


1. Add learning resources.
2. Register participants.
3. Borrow learning resources.
4. Return learning resources.
5. Display available learning resources.
6. Display registered participants.
7. Display transaction history.
8. Validate user input and menu selections.


## Object-Oriented Programming Concepts


**Classes and Objects:** LearningResource, Participant, and LearningCenter.
**Constructors:** Initialize resource and participant information.
**Encapsulation:** Private fields using underscore prefixes and getters/setters.
**Inheritance:** LearningResource and Participant inherit from CenterRecord.
**Abstraction:** CenterRecord is an abstract parent class.
**Polymorphism:** Both subclasses implement displayDetails().
**Mixins:** TimestampMixin and Borrowable provide reusable behavior.
**Collections:** Lists and Maps organize records and transactions.
## Sample Test Scenarios


| Test | Input | Expected Result |
|---|---|---|
| 1 | Add resource R001 | Resource is registered |
| 2 | Register participant P001 | Participant is registered |
| 3 | Borrow R001 using P001 | Resource becomes unavailable |
| 4 | Return R001 | Resource becomes available |
| 5 | Enter menu choice 99 | Invalid choice message appears |


## Instructions for Running


1. Install the Dart SDK or open DartPad.
2. Create a Dart console project.
3. Save the source code as main.dart.
4. Complete the required application logic.
5. Run the program using:
bash
dart run main.dart
