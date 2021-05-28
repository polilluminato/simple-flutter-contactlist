import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactList extends StatelessWidget {
  late final List<Contact> contacts;
  ContactList({required this.contacts}) : super();

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: contacts.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: new ListTile(
            title: Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text(contacts[index].name),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
        );
      },
    );
  }
}
