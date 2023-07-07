import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  List<Contact> contacts = [];

  @override
  void initState() {
    fetchContacts(context);
    super.initState();
  }

  Future<void> fetchContacts(BuildContext context) async {
    final PermissionStatus status = await Permission.contacts.request();
    if (status.isGranted) {
      try {
        final Iterable<Contact> fetchedContacts = await ContactsService
            .getContacts();
        processContacts(fetchedContacts, contacts);
        // Process the fetched contacts
      } catch (e) {
        // Show error message in a SnackBar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error fetching contacts: $e'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } else if (status.isDenied) {
      // Show permission denied message in a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Permission denied to access contacts.'),
          duration: Duration(seconds: 3),
        ),
      );
    } else if (status.isPermanentlyDenied) {
      // Show permanently denied message and open app settings
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Permission permanently denied. Open app settings to enable contacts permission.'),
          duration: Duration(seconds: 3),
        ),
      );
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          final bool hasGreenIndicator = true; // Replace with your indicator condition
          final bool hasRedIndicator = false; // Replace with your indicator condition

          return GestureDetector(
            onTap: () {
              // Handle tap event here
              print('Tapped on contact: ${contact.displayName}');
            },
            child: Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListTile(
                  title: Text(
                    contact.displayName ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                      contact.phones?.isNotEmpty == true ? contact.phones!.first
                          .value ?? '' : ''),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (hasGreenIndicator)
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                      if (hasRedIndicator)
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

}



void processContacts(Iterable<Contact> fetchedContacts, List<Contact> contacts) {
  // Update the contacts list with the fetched contacts
  contacts.clear(); // Clear the existing contacts
  contacts.addAll(fetchedContacts); // Add the fetched contacts to the list
}