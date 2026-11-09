import 'dart:io';


mixin TimestampMixin {
  DateTime createdAt = DateTime.now();


  String getDateCreated() {
    return createdAt.toString().substring(0, 19);
  }
}


abstract class CenterRecord with TimestampMixin {
  int id;
  String name;


  CenterRecord(this.id, this.name);


  void displayDetails();
}


class LearningResource extends CenterRecord {
  String _category;
  int _availableCopies;


  LearningResource(
    int id,
    String name,
    String category,
    int availableCopies,
  )   : _category = category,
        _availableCopies = availableCopies,
        super(id, name);


  String get category => _category;


  int get availableCopies => _availableCopies;


  void borrowResource() {
    if (_availableCopies > 0) {
      _availableCopies--;
      print('Resource borrowed successfully!');
    } else {
      print('Sorry, no available copies.');
    }
  }


  void returnResource() {
    _availableCopies++;
    print('Resource returned successfully!');
  }


  @override
  void displayDetails() {
    print('--------------------------------');
    print('Resource ID: $id');
    print('Resource Name: $name');
    print('Category: $_category');
    print('Available Copies: $_availableCopies');
    print('Date Added: ${getDateCreated()}');
  }
}


class Participant extends CenterRecord {
  String _email;
  int _borrowedResources = 0;


  Participant(
    int id,
    String name,
    String email,
  )   : _email = email,
        super(id, name);


  String get email => _email;


  int get borrowedResources => _borrowedResources;


  void borrowItem() {
    _borrowedResources++;
  }


  void returnItem() {
    if (_borrowedResources > 0) {
      _borrowedResources--;
    }
  }


  @override
  void displayDetails() {
    print('--------------------------------');
    print('Participant ID: $id');
    print('Participant Name: $name');
    print('Email: $_email');
    print('Borrowed Resources: $_borrowedResources');
    print('Registration Date: ${getDateCreated()}');
  }
}


List<LearningResource> resources = [];
List<Participant> participants = [];


Map<int, LearningResource> resourceMap = {};
Map<int, Participant> participantMap = {};


String getInput(String message) {
  while (true) {
    stdout.write(message);
    String? input = stdin.readLineSync();


    if (input != null && input.trim().isNotEmpty) {
      return input.trim();
    }


    print('Invalid input! Please enter a value.');
  }
}


int getInteger(String message) {
  while (true) {
    String input = getInput(message);


    try {
      int number = int.parse(input);


      if (number >= 0) {
        return number;
      }


      print('Please enter a non-negative number.');
    } catch (e) {
      print('Invalid number! Please try again.');
    }
  }
}


void addResource() {
  print('\nADD LEARNING RESOURCE');


  int id = getInteger('Enter Resource ID: ');


  if (resourceMap.containsKey(id)) {
    print('Resource ID already exists!');
    return;
  }


  String name = getInput('Enter Resource Name: ');
  String category = getInput('Enter Resource Category: ');
  int copies = getInteger('Enter Available Copies: ');


  LearningResource resource =
      LearningResource(id, name, category, copies);


  resources.add(resource);
  resourceMap[id] = resource;


  print('\nLearning resource added successfully!');
}


void registerParticipant() {
  print('\nREGISTER PARTICIPANT ');


  int id = getInteger('Enter Participant ID: ');


  if (participantMap.containsKey(id)) {
    print('Participant ID already exists!');
    return;
  }


  String name = getInput('Enter Participant Name: ');
  String email = getInput('Enter Participant Email: ');


  if (!email.contains('@') || !email.contains('.')) {
    print('Invalid email address!');
    return;
  }


  Participant participant = Participant(id, name, email);


  participants.add(participant);
  participantMap[id] = participant;


  print('\nParticipant registered successfully!');
}


void viewRecords() {
  print('\nCOMMUNITY LEARNING CENTER RECORDS');


  if (resources.isEmpty && participants.isEmpty) {
    print('No records available.');
    return;
  }


  // Polymorphism using shared parent class
  List<CenterRecord> allRecords = [
    ...resources,
    ...participants
  ];


  for (CenterRecord record in allRecords) {
    record.displayDetails();
  }


  print('--------------------------------');
  print('Total Resources: ${resources.length}');
  print('Total Participants: ${participants.length}');
}


void borrowResource() {
  print('\nBORROW RESOURCE');


  if (resources.isEmpty || participants.isEmpty) {
    print('Please add a resource and register a participant first.');
    return;
  }


  int participantId = getInteger('Enter Participant ID: ');


  Participant? participant = participantMap[participantId];


  if (participant == null) {
    print('Participant not found!');
    return;
  }


  int resourceId = getInteger('Enter Resource ID: ');


  LearningResource? resource = resourceMap[resourceId];


  if (resource == null) {
    print('Resource not found!');
    return;
  }


  if (resource.availableCopies > 0) {
    resource.borrowResource();
    participant.borrowItem();
    print('${participant.name} borrowed ${resource.name}.');
  } else {
    print('Transaction unsuccessful. No copies available.');
  }
}


void returnResource() {
  print('\nRETURN RESOURCE');


  if (resources.isEmpty || participants.isEmpty) {
    print('No records available.');
    return;
  }


  int participantId = getInteger('Enter Participant ID: ');


  Participant? participant = participantMap[participantId];


  if (participant == null) {
    print('Participant not found!');
    return;
  }


  int resourceId = getInteger('Enter Resource ID: ');


  LearningResource? resource = resourceMap[resourceId];


  if (resource == null) {
    print('Resource not found!');
    return;
  }


  if (participant.borrowedResources <= 0) {
    print('This participant has no borrowed resources.');
    return;
  }


  participant.returnItem();
  resource.returnResource();


  print('${participant.name} returned ${resource.name}.');
}


void displayMenu() {
  print('======================================');
  print('     COMMUNITY LEARNING CENTER SYSTEM');
  print('======================================');
  print('1. Add Learning Resource');
  print('2. Register Participant');
  print('3. View All Records');
  print('4. Borrow Resource');
  print('5. Return Resource');
  print('6. Exit');
  print('======================================');
}


void main() {
  bool running = true;

  while (running) {
    displayMenu();


    String choice = getInput('Enter your choice (1-6): ');


    switch (choice) {
      case '1':
        addResource();
        break;


      case '2':
        registerParticipant();
        break;


      case '3':
        viewRecords();
        break;


      case '4':
        borrowResource();
        break;


      case '5':
        returnResource();
        break;


      case '6':
        print('\nThank you for using the system!');
        print('Program terminated successfully.');
        running = false;
        break;


      default:
        print('\nInvalid menu choice! Please select 1-6.');
    }
  }
}