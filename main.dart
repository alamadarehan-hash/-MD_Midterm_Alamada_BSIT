import 'dart:io';

mixin TimestampMixin {
  DateTime createdAt = DateTime.now();
  String get timestamp => createdAt.toString();
}

abstract class CenterRecord with TimestampMixin {
  String _id;
  String _name;
  CenterRecord(this._id, this._name);
  String get id => _id;
  String get name => _name;

  set name(String value) {
    if (value.trim().isNotEmpty) {
      _name = value.trim();
    }
  }
  String displayDetails();
}

class LearningResource extends CenterRecord {
  String category;
  bool isBorrowed = false;
  LearningResource(
    String id,
    String title,
    this.category,
  ) : super(id, title);

  @override
  String displayDetails() {
    return 'Resource ID: $id | Title: $name | '
        'Category: $category | '
        'Status: ${isBorrowed ? "Borrowed" : "Available"}';
  }
}

class Participant extends CenterRecord {
  String contactNumber;
  Participant(
    String id,
    String name,
    this.contactNumber,
  ) : super(id, name);

  @override
  String displayDetails() {
    return 'Participant ID: $id | Name: $name | '
        'Contact: $contactNumber';
  }
}

class LearningCenter {
  final List<LearningResource> resources = [];
  final List<Participant> participants = [];
  final Map<String, LearningResource> resourceMap = {};
  final Map<String, Participant> participantMap = {};

  bool addResource(
    String id,
    String title,
    String category,
  ) {
    if (id.isEmpty || title.isEmpty || category.isEmpty) {
      return false;
    }
    if (resourceMap.containsKey(id)) {
      return false;
    }

    LearningResource resource =
        LearningResource(id, title, category);
    resources.add(resource);
    resourceMap[id] = resource;

    return true;
  }

  bool registerParticipant(
    String id,
    String name,
    String contact,
  ) {
    if (id.isEmpty || name.isEmpty || contact.isEmpty) {
      return false;
    }
    if (participantMap.containsKey(id)) {
      return false;
    }

    Participant participant =
        Participant(id, name, contact);
    participants.add(participant);
    participantMap[id] = participant;

    return true;
  }


  String borrowResource(String resourceId, String participantId) {
    LearningResource? resource = resourceMap[resourceId];
    Participant? participant = participantMap[participantId];

    if (resource == null) {
      return 'Resource not found.';
    }
    if (participant == null) {
      return 'Participant not found.';
    }
    if (resource.isBorrowed) {
      return 'Resource is already borrowed.';
    }
    resource.isBorrowed = true;

    return '${participant.name} successfully borrowed ${resource.name}.';
  }

  String returnResource(String resourceId) {
    LearningResource? resource = resourceMap[resourceId];

    if (resource == null) {
      return 'Resource not found.';
    }
    if (!resource.isBorrowed) {
      return 'Resource is not currently borrowed.';
    }
    resource.isBorrowed = false;

    return '${resource.name} successfully returned.';
  }


  void viewRecords() {
    print('\n========== LEARNING RESOURCES ==========');
    if (resources.isEmpty) {
      print('No learning resources registered.');
    } else {
      for (CenterRecord record in resources) {
        print(record.displayDetails());
      }
    }

    print('\n========== PARTICIPANTS ==========');
    if (participants.isEmpty) {
      print('No participants registered.');
    } else {
      for (CenterRecord record in participants) {
        print(record.displayDetails());
      }
    }
    print('\nTotal Resources: ${resources.length}');
    print('Total Participants: ${participants.length}');
    int available = resources.where((r) => !r.isBorrowed).length;
    print('Available Resources: $available');
    print('Borrowed Resources: ${resources.length - available}');
  }
}

String getInput(String message) {
  stdout.write(message);
  return stdin.readLineSync()?.trim() ?? '';
}


void main() {
  LearningCenter center = LearningCenter();
  bool running = true;

  print('\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  print(' COMMUNITY LEARNING CENTER MANAGEMENT');
  print('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
  while (running) {
    print('\n--------------- MAIN MENU ---------------');
    print('1. Add Learning Resource');
    print('2. Register Participant');
    print('3. Borrow Learning Resource');
    print('4. Return Learning Resource');
    print('5. View All Records');
    print('6. Exit');
    print('-----------------------------------------');
    try {
      String choice = getInput('Enter your choice: ');
      switch (choice) {
        case '1':
          String id = getInput('Enter Resource ID: ');
          String title = getInput('Enter Resource Title: ');
          String category = getInput('Enter Category: ');

          if (center.addResource(id, title, category)) {
            print('Learning resource added successfully!');
          } else {
            print('Invalid input or duplicate Resource ID.');
          }
          break;

        case '2':
          String id = getInput('Enter Participant ID: ');
          String name = getInput('Enter Participant Name: ');
          String contact = getInput('Enter Contact Number: ');
          if (center.registerParticipant(id, name, contact)) {
            print('Participant registered successfully!');
          } else {
            print('Invalid input or duplicate Participant ID.');
          }
          break;

        case '3':
          String resourceId = getInput('Enter Resource ID: ');
          String participantId = getInput('Enter Participant ID: ');
          print(center.borrowResource(resourceId, participantId));
          break;

        case '4':
          String resourceId = getInput('Enter Resource ID: ');
          print(center.returnResource(resourceId));
          break;

        case '5':
          center.viewRecords();
          break;

        case '6':
          running = false;
          print('Thank you for using the system!');
          break;

        default:
          print('Invalid choice! Please select from 1 to 6.');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
