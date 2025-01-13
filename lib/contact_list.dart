// ignore_for_file: must_be_immutable, unused_import

import 'package:contact_app/contact.dart';
import 'package:flutter/material.dart';
import 'package:contact_app/addcontact.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  List<Contact> contacts = [
    Contact(id: '1', name: 'John Doe', number: '123-456-7890'),
  ];

  void addContact(String name, String number) {
    setState(() {
      contacts.add(Contact(
        id: DateTime.now().toString(),
        name: name,
        number: number,
      ));
    });
  }

  void deleteContact(String id) {
    setState(() {
      contacts.removeWhere((contact) => contact.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "CONTACT LIST",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: contacts.isEmpty
          ? Center(child: Text('No contacts yet!'))
          : ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  title: Text(contact.name),
                  subtitle: Text(contact.number),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => deleteContact(contact.id),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Addcontact(onAddContact: addContact),
              ));
        },
      ),
    );
  }
}
